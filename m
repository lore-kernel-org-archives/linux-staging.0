Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D4772
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 02:01:29 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id u3so41028282ejz.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 19:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PJcK1jrVY4a0zfanTvm7jn/Cp34lV2SoXKYxTKCdE1M=;
        b=rb2ZJI6Vsah1Tlfuf1MARmIB4dJS1IqVLR+1L3KhHdxaQTLq9SPSUF+SLz4Prj3U7N
         7TQyUN29zG8P0/DLV/tG3+q5OpR2chKateMTf9AFvo8KpjVv4fZVi+4zct6lHO9/K2fX
         8y3qzNtGrUiPK45fV/bHRocVCld7KCKLGwUA5zHyHjHP5SN8jLTLk9pHB6krq/cYiQKe
         K742c1goJtMLOJeJP+UTiCCsc29N5YnX6l92qHjlROdvb2tVTbArO68G4NkDi+5w1XPC
         /NMcDWr6FhFDq0mqu1kkZi8DCpxFtc6nVFqYG1VIj7/aknxBHoGbSZFBdrRsoCUPco22
         mfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PJcK1jrVY4a0zfanTvm7jn/Cp34lV2SoXKYxTKCdE1M=;
        b=byJcFr+3glvYaEEeJ2LLoVWcjXm+GUh1gpjkJt24mopqSHunNnQvwv1+shPQlCZZKF
         KqIW3nkh9iRXpjlGiXqYUm5xAEPDyEraxcGi9YN94bZetFS3mL4dGDMXRm6CfbRSvFfB
         /chsWEEB9AG9T+vgY2ElAEafy7wvWovIgShdiXx5TNQpKbqOy/i3+jDRYvLMPawi7bX7
         B+qYBDKZuD6ONIZ3nl1uODH8rICORVamlxjcD254axwKeBF0ljl3BbUI2v/vJVtOyUZs
         95GYWckU5/7cq9+1Oi1hRGvGmn4teT387dwCbjzZCSBpooQ7+xDxU/PgPubrXWXoqv4I
         Aqcg==
X-Gm-Message-State: AOAM53247gpvQwsHcXM4dOrUb2IF6FHh0yGqR1yOF8EPD8YmY3sYbwLI
	+438Yv4L8YSlMooweupOFDg=
X-Google-Smtp-Source: ABdhPJxED1RBUXtSJN1dGKfFovRwS9fCSe8+Bso+p5QGFfm+LFU+CwhraCb3XlwdrCPW2FxhcfdG9Q==
X-Received: by 2002:a17:906:9b53:: with SMTP id ep19mr13897879ejc.86.1629770487919;
        Mon, 23 Aug 2021 19:01:27 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id p23sm10615239edw.94.2021.08.23.19.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 19:01:27 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Skripkin <paskripkin@gmail.com>
Subject: Re: [PATCH 1/2] staging: r8188eu: Use usb_control_msg_recv/send() in usbctrl_vendorreq()
Date: Tue, 24 Aug 2021 04:01:26 +0200
Message-ID: <4118209.ZeClQeRtK1@localhost.localdomain>
In-Reply-To: <1815496.OexNakQ7IY@localhost.localdomain>
References: <20210823223751.25104-1-fmdefrancesco@gmail.com> <15825589.4VbMHeJK9p@localhost.localdomain> <1815496.OexNakQ7IY@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On Tuesday, August 24, 2021 3:38:03 AM CEST Fabio M. De Francesco wrote:
> I think that I've inadvertently switched the order by which usb_control_msg_send()
> and memcpy() are called. I'm very sorry for not doing my tests, but (as I had said 
> before) at the moment I don't have my device with me.

No, I did not switch them. There must be something else... 
Sorry for the noise.

Fabio



