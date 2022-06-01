Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5893D65
	for <linux-staging@lists.linux.dev>; Wed,  1 Jun 2022 22:12:41 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id k187so4455562oif.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Jun 2022 15:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=318Q6Qczrs0gaZiueUE6sUN9b6V2tRNRKs1HyuCzOGk=;
        b=C6dZge6VD1zZvM0YtKvIiVLmQ7J/We3MzW1RTuREpnwqvBmkZH4M9bZjDjWzaCHXuZ
         tdz4k+Qj7W4IJLla2OfxWB+82I5GIoW5q5EKpYSjAPIOeEN/YMTllVRN+7ZqhbH2AsfA
         F68Z+tLqlYKcACwMyi70JcigwgYGEMTcBNXJK3qNd1HxxilFqzFWIlak3EIUZ4kIAnfP
         BglauYfoXYrkl4XaZ+G726c8iiQRkH/SVq9aeJLgeUOvqP1PhGmdoECKd4hJVdgGX4Pt
         0l/L8gkQ1Wc/4yIVuneUBpRlqBmpr6UUcWUk/tvOJkeB163GhviNRn90/3w4FWIl2asp
         eNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=318Q6Qczrs0gaZiueUE6sUN9b6V2tRNRKs1HyuCzOGk=;
        b=2tKfZbAy9Q+Mo5PeN5RT9DQmB0UMU1Rj+HBLIDQtAJlsKGj7kJnr1HdAyWVj6DwfYD
         naTUFQCnH9tAxNg4l1gD4CSWijociNZVxpCGjOkoJBgmlQJNMZEWyT78rV2LipBV4GAv
         7LcEb2/2MhKXAn49WfoMxv9GS8urqjvSeKCIExwlmOLIV20fi36NmKIxdnl4jQbsG+c1
         gOik7p4eJ/6kA1IiELIMVlZn65KNRSvNiZyMfygQJOiWTd18uxG49P0uhjcSaKq0PzBB
         JBO+yKnff0GuRKyDoaXPsgtGlNP9Inx2BTGz9ImpZEyfhXwdw+7wsEsjRPFmriUAkD+R
         /SeA==
X-Gm-Message-State: AOAM532Eap3zdB9CzP2C28pg7PgRNOeo/Q7dd3a6x+InArBVaY0UV7/4
	/rNvy7RIF4SAEj/E7a7sULY=
X-Google-Smtp-Source: ABdhPJw4ktQR7P/PaDPAYpiOW/vAzHiblXT65I34anjdP8AE6MefNddWmPUI3vfpDLud0LXJk7wUBA==
X-Received: by 2002:a05:6808:1912:b0:32b:1c01:3ca4 with SMTP id bf18-20020a056808191200b0032b1c013ca4mr991388oib.0.1654121560777;
        Wed, 01 Jun 2022 15:12:40 -0700 (PDT)
Received: from debian-BULLSEYE-live-builder-AMD64 ([191.84.230.38])
        by smtp.gmail.com with ESMTPSA id c90-20020a9d27e3000000b006060322124esm1327782otb.30.2022.06.01.15.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 15:12:40 -0700 (PDT)
Date: Wed, 1 Jun 2022 19:12:28 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Adrien Thierry <athierry@redhat.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	gascoar@gmail.com
Subject: Re: [PATCH v2 0/9] staging: vchiq_arm: remove some unnecessary
 global variables
Message-ID: <20220601221228.cffvvnwm37b7q3xf@debian-BULLSEYE-live-builder-AMD64>
References: <20220518191126.60396-1-athierry@redhat.com>
 <e9d2cf9a-c4f0-997f-72f5-1b10379dc126@i2se.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9d2cf9a-c4f0-997f-72f5-1b10379dc126@i2se.com>

On Mon, May 30, 2022 at 10:19:14PM +0200, Stefan Wahren wrote:
> Hi Adrien,
> 
> Am 18.05.22 um 21:11 schrieb Adrien Thierry:
> > This patch series aims at removing some unnecessary global structures
> > (namely, 'g_dev' and 'vchiq_states'), in order to make the driver more
> > robust. This is part of an effort to address TODO item "Get rid of all non
> > essential global structures and create a proper per device structure".
> 
> sorry for the delay, but i was fighting with some platform regressions in
> Linux 5.18.
> 
> So except of my comments, this series is:
> 
> Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> 
>

Hi Stefan,

Not directly related to these patches, but if you don't mind I would
like to know what tests in specific are necessary to tag a Tested-by on
a vchiq patch?

For instance, running the userland vchiq_test -f on a RPi 3B would be
enough?

thanks,

Gaston
