Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3443772
	for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 09:48:10 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a25so23573962ejv.6
        for <linux-staging@lists.linux.dev>; Wed, 25 Aug 2021 02:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1JEyW4ofYFR7gRvxQ/3QzOt6Hjv6xQimeZo0h4SFCYo=;
        b=Q6qSO2aNJrvMC4MnKubpHgYs6sVtj61b/0Z13eHl85RB2T7mELC0ljJL4vmVsbCkNB
         HpLsT7fBPyDvuJlm4aMO0M6X1396xRWmshPhVcbnEUgwBeeWsbMWCOvH1Da9cg5bOuWy
         5hN45v2x2JnaPEq/JK6G1LBOfhr4/yJ5HDJNNqNX+LaWBI0Z/0A5ZPA1Mau51fNi5sst
         Q9V9cN2ZBOO/5jrHgStCVLw+WXuQJLRQxUMugZEMzMs/1E0gZOwilDvTZWfJGX3yVCo7
         /cs8+mZ/JdYnyFTiCi18/VnLwwkUeqOKoe2Iy4CnfBF4dybQ4YJR8eb3slWaJVmG/ysK
         NmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1JEyW4ofYFR7gRvxQ/3QzOt6Hjv6xQimeZo0h4SFCYo=;
        b=t6LtOpweGg4zVyocy9J68SQy3T4fYx4ACSuTkkE1nhgbLpvbITepyrY+RO/ZcW/70g
         kcbaSapbKC1XxpMY8/Hrotp9xgdTAtjkVeEGE1LVd3Zhn1FcV97ppkXifO8q15zVWGPr
         2Za4BmHhMGmRPiNB/oDnvbGV9tv70mkynntAZuXorjtipLOXR26ja0T2HvgQeIsez7Or
         3CNYUTWFVW02tIhF8rfg+LdTthVlsTCG87qippoHfbqPp82FPWJIKjDXn1k97hqz0mlY
         BH9FPMb6P9RL3v5w8jRLfCVnZalq69GnQ1PkaaaNkDddN/qe3fr7OfbeE4qvXVXzpMy9
         UooA==
X-Gm-Message-State: AOAM5324V7rxiJj9cLubRhxnTgy9/TyxZywGDW7oqN1LEnFY+2I7ppK8
	E8QxH5XmuIayphhP3qwl2y4=
X-Google-Smtp-Source: ABdhPJxFY5+BnAFtJclQ1CzwvfXeNtjKhPn5zsQ/1GTaHN4W8Uv7IKYdgoY5Phnmjgsa+2qSKwmq/w==
X-Received: by 2002:a17:907:5096:: with SMTP id fv22mr8776103ejc.95.1629884888509;
        Wed, 25 Aug 2021 02:48:08 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id x9sm11393068edj.95.2021.08.25.02.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 02:48:08 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, gregkh@linuxfoundation.org, straube.linux@gmail.com, Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] staging: r8188eu: add error handling of rtw_read16
Date: Wed, 25 Aug 2021 11:48:05 +0200
Message-ID: <2227654.mbYB7oqmoa@localhost.localdomain>
In-Reply-To: <ab20fcd7-69a8-0530-7770-0e309178b0f0@gmail.com>
References: <cover.1629789580.git.paskripkin@gmail.com> <1665728.ljvk3MsED4@localhost.localdomain> <ab20fcd7-69a8-0530-7770-0e309178b0f0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Wednesday, August 25, 2021 10:22:16 AM CEST Pavel Skripkin wrote:
> On 8/25/21 7:35 AM, Fabio M. De Francesco wrote:
> > Dear Pavel,
> > 
> > Please note that if and when my patch "Use usb_control_msg_recv / send () in
> > usbctrl_vendorreq ()" will be merged, "if (res! = len)" will always evaluate 'true'
> > and usb_read16 () will always return -EIO even if usbctrl_vendorreq () succeeds.
> > 
> 
> Yep, thank you, but it depends on which series will go in first :)
> 
> There is a chance, that you will need to clean up this part, if mine 
> will be merged before yours
> 

Ha-ha ... I know that beautiful rule: whoever breaks must fix! 
However there should be another rule which says that
the old (me) takes precedence over the young (you) :-)

Seriously, thank you so much for your help and the "Reviewed by" 
tag on my work.

Regards,

Fabio
  
> With regards,
> Pavel Skripkin
> 




