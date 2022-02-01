Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA12329CA
	for <linux-staging@lists.linux.dev>; Tue,  1 Feb 2022 07:09:43 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id e28so15044223pfj.5
        for <linux-staging@lists.linux.dev>; Mon, 31 Jan 2022 23:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=30OxmrfKBbCG4hj/X3lsJFFvPMa8rJcIl2RH+GTl1+c=;
        b=mhDV0XtJlte0Om1SvFzaHSKspJpOm4zs+iaK7pwkTbq02CRjXk7keFp0VG1dgt3NAQ
         HhZlEK8n/5JsdmEiiQgaYAyhBJ8QJOSOQknTuBXjZ5oj0+MtTPh8fVsqxVLFjWWxuW/v
         wQ59egONKIocS0nvyFlCnlLGT1yIaPO14HhFbVcCyQVsX0TqGvo+HUCSJcXUOnI2pC10
         WNBa763RKmq7xot14B/U2BzflA796QfH98wCFvmBVEmtiQ7VnCtqIvoblsjaW236AAgf
         shU7DLKubnotSnFp/70OkQBgfj8DGsLOwm5y2os0E/SHhZpxFpX6lMq6hMmvbIRKOdOD
         TMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=30OxmrfKBbCG4hj/X3lsJFFvPMa8rJcIl2RH+GTl1+c=;
        b=Z1/KWA2juXFfNUrlEwQBx9hIm+bGN8Ikm3/UNIe0wwwLC9+mYqyuJicQ6Ly4+Qf8F4
         Bxdrt8/doY2z3WzC4lL0k9VBKxDOI+t6wHhjxHKxM55nwHri9xySQ5EKBalZT7vfkP23
         4uH87S3LL/9hZmIj9sct/2O8FbOuO6eMxnGzOZSWCiSvsS5HtdbPjItiAVh/LBeoUtWQ
         +Vx3hWZNy3QnIw84BshgTlM5PF0m3frxSk8k5M1ti7ZwYBzo9FKYnLZLC8F9MT60M7bY
         K9Wefn3Ow8yYceddr/otCG3tFtCFAym9yiF5hDHpS4tiaH6q2Dy0VOs0v72qwUx4uHIr
         0sUw==
X-Gm-Message-State: AOAM5325H3YRvxYH4KZGa0HvOimthw+LY42EF8ZmfCjWcv/vqZKGVTt6
	3ZJ39hFQDi3sChfUGtEISw0=
X-Google-Smtp-Source: ABdhPJziuKz49mS+l3/gxjF2ulHnmtnYWYPEnlwQpCgJgPtp9ORDVwZExaGCW2JC7ubPOPU27LhpOQ==
X-Received: by 2002:a63:f30e:: with SMTP id l14mr19357924pgh.410.1643699383259;
        Mon, 31 Jan 2022 23:09:43 -0800 (PST)
Received: from [10.59.0.6] ([85.203.23.80])
        by smtp.gmail.com with ESMTPSA id q19sm19964158pfn.159.2022.01.31.23.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 23:09:42 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] staging: wfx: possible deadlock in wfx_conf_tx() and
 wfx_add_interface()
To: jerome.pouiller@silabs.com, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <6f489bf2-bac0-8030-7ea5-6f5c12daa568@gmail.com>
Date: Tue, 1 Feb 2022 15:09:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

My static analysis tool reports a possible deadlock in the wfx driver in 
Linux 5.16:

wfx_conf_tx()
   mutex_lock(&wdev->conf_mutex); --> Line 225 (Lock A)
   wfx_update_pm()
     wait_for_completion_timeout(&wvif->set_pm_mode_complete, ...); --> 
Line 3019 (Wait X)

wfx_add_interface()
   mutex_lock(&wdev->conf_mutex); --> Line 737 (Lock A)
   complete(&wvif->set_pm_mode_complete); --> Line 758 (Wake X)

When wfx_conf_tx() is executed, "Wait X" is performed by holding "Lock 
A". If wfx_add_interface() is executed at this time, "Wake X" cannot be 
performed to wake up "Wait X" in wfx_conf_tx(), because "Lock A" has 
been already hold by wfx_conf_tx(), causing a possible deadlock.
I find that "Wait X" is performed with a timeout, to relieve the 
possible deadlock; but I think this timeout can cause inefficient execution.

I am not quite sure whether this possible problem is real and how to fix 
it if it is real.
Any feedback would be appreciated, thanks :)


Best wishes,
Jia-Ju Bai

