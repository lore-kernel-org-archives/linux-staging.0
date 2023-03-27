Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1175DEA3;
	Mon, 27 Mar 2023 12:25:50 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id l37so4950359wms.2;
        Mon, 27 Mar 2023 05:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679919949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uslYjtv4m4AksflLGnoX5lwwTxOvcq4QRw5RlSVhmQw=;
        b=PolfwCa4IcIK/n1Oye+8d0lgDu5S86ppO9k9VnMxzkxR4mlDsXWKRuEN8Wwa9GHlLi
         TRRK46gDB7oUpZyQDk98GV+bj/f1JD3ILY4I/x2RqkTgtJToR/klNkZmZk+D0fy5S7Ov
         7oaUO59O34ggm9cYdnewFt66WppKiqlW3zkEF+7+aURbQpDjOWGDNM8W/w0K94l4x2W7
         CTizHGz0IVtz4H7qjCkZpXAzY7tEzvA5QIPJSwICyJGGtRAnZeagBGYVnhENx4VlXkLz
         UrEqPXgcP3LfY13X9A68zKtG5KMdfZYaBhp9rAIARwmentau8XmHIlBAJsytXYlhafBF
         6CZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679919949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uslYjtv4m4AksflLGnoX5lwwTxOvcq4QRw5RlSVhmQw=;
        b=YpEYvEbdLMXoAah+2rC6DggXzrarqMjjjfhpJqRf+HY/d4UwGsWFXJQrH1oJO817TN
         d4jhsjjykmFjuRs4MlCzCzRISbvBnQ6+AruHT6CYJ1EF6CWsEaiAQDj5CPDtWMVgKROp
         xRLhfaP7o1etZSN+L9cgybffQ0XUbe7QaXkLcz3UEDinr/GUpNy/HwMYtYl//U+keuz4
         9DO1aJFQ0xhuqJjqxVbF8HIF7Of2l+ZULuj1F2fqtUKPXFZCPZ+RXCYzBaQy2MOU9l59
         JCFAty3oXQ6wNcwYqqrlI3ZcaNQV3BP94OhmEGGPK6gK1EqsXC11MoeDDSrnZ3tYfPpM
         5TRQ==
X-Gm-Message-State: AO0yUKXiJHxIjZ4UbtG2r3+EbC6J8ZjjyXOFE7j/cZ2FBkiSYKveA01j
	j2lt+dFlmfL2DK1d9hcItkw=
X-Google-Smtp-Source: AK7set/0A4okK2dgo4fW1zVAEQe9LUB6jX7YJlVK/yTZPM2X1C4gkyjrVKH+mEqxf1SGXfO7XIX7Zg==
X-Received: by 2002:a05:600c:d2:b0:3ee:9909:acc8 with SMTP id u18-20020a05600c00d200b003ee9909acc8mr9576073wmm.32.1679919949093;
        Mon, 27 Mar 2023 05:25:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i6-20020a05600c354600b003ede6540190sm8895718wmq.0.2023.03.27.05.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:25:48 -0700 (PDT)
Date: Mon, 27 Mar 2023 15:25:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: replace udelay() with usleep_range()
Message-ID: <453453f4-1496-4735-8fab-efb7e4240e05@kili.mountain>
References: <ZCGK4+zUDT1lLz6s@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCGK4+zUDT1lLz6s@khadija-virtual-machine>

On Mon, Mar 27, 2023 at 05:24:03PM +0500, Khadija Kamran wrote:
> Replace 'udelay()' with 'usleep_range()' with 1000us as upper limit.
> This issue is reported by checkpatch.pl script.
> 
> CHECK: usleep_range is preferred over udelay; see
> Documentation/timers/timers-howto.rst
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---

This kind of change requires you to test on the hardware and have
slightly in depth knowledge of the spec.

regards,
dan carpenter

