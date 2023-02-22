Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F073B5392
	for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 13:40:19 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so468384wms.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Feb 2023 05:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4zo8Nq8J0Yr+vfRIFFqz72ULSWXGLZTJiTYN3NpfUU=;
        b=kqzBFy+VvPElF9Pz21swhoW3pB7D0WavOwSXl6z1K257i8Ok+E8L0j3vF8MST3buWn
         rWEuRzTW6eHhYMVYa+ofmuHarHvkbZYgs7anXaqG3aCBBMw+3bEV9qM/59Tu0OV0+ATW
         rEIZoIXcIY6H/H+mhVw4QdSR/OmYPpw0LUNq0AXGH16UlcFKWIP9qym/RgHxrsBflcCG
         cxVm8BtVuhmzfHEKh3daFRNnY6j4gZFJiJWv46Wbt3JCRQn9LFO18/+28EtTbsmOVPB/
         OtTbGRjzL0uFGWS3AsXwZXg3mTxjYyMc6nD38RZ+ojtdg0gjTLC/DmVD9Zjts+GhNRjL
         FuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4zo8Nq8J0Yr+vfRIFFqz72ULSWXGLZTJiTYN3NpfUU=;
        b=gUJDf3sIZywrUuzLUnx5Vu2z2OTbnd2Gw5b2q7/lLaSsmGDJw4RJIKndhNd40rnekN
         G5hRHPUysvs1SkXKnkVndtI5SVCZyzhyeCCsPviCFGxaOQGntWQn9l1uDIwVWlmzigZC
         dJI2J7b46bBiLh7QJ5hqp6GSQ0deeZudsbZ8F9xisWIihVb2P/SPgaZmnM2qs4s77bbb
         JTDq1WKmVrylkQf7YuRj/Mzalsu8AnPdv761SU9PRu4YdpEI43FoinHFzWanP0198zKJ
         k6XWFCis8Sh53G0svDNsh9meaGUI2SRkj4xzVBzNQ3Ivvch2UoXrFGuOPfMW7p+aaEc9
         kDNg==
X-Gm-Message-State: AO0yUKXhHUXo9cJeHDw/G+nbTutBmoR2pUm5RIMlHXPdRxZHTgOko7wp
	ML0rv/27PFxVClKDS5D+oVbx4B1jXFY=
X-Google-Smtp-Source: AK7set9G4vCcIIJPHs5YbZbgy0rj7gwp3j1ecTnX8yq5P6gFQRfWLV3dtRTHDvlqk2/EB0XjSAz69g==
X-Received: by 2002:a05:600c:4e41:b0:3e2:1a5e:b150 with SMTP id e1-20020a05600c4e4100b003e21a5eb150mr6902090wmq.2.1677073218093;
        Wed, 22 Feb 2023 05:40:18 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bce16000000b003e209b45f6bsm6116877wmc.29.2023.02.22.05.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 05:40:17 -0800 (PST)
Date: Wed, 22 Feb 2023 16:40:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] staging: rtl8192e: Remove entry .nic_type from
 struct rtl819x_ops
Message-ID: <Y/YbN9GRdUj7f+oj@kadam>
References: <cover.1677010997.git.philipp.g.hortmann@gmail.com>
 <f1fd37a2d2b90bef8caac31a98f3eeff404b3095.1677010997.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1fd37a2d2b90bef8caac31a98f3eeff404b3095.1677010997.git.philipp.g.hortmann@gmail.com>

On Tue, Feb 21, 2023 at 09:53:43PM +0100, Philipp Hortmann wrote:
> Remove unchanged entry .nic_type and replace it with constant NIC_8192E.
> This increases readability of the code.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
>  drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
>  drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
>  drivers/staging/rtl8192e/rtl8192e/rtl_pci.c  | 6 +++---
>  3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> index 2d2f9d4a0ff5..044cab649ff1 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> @@ -26,7 +26,6 @@ int hwwep = 1;
>  static char *ifname = "wlan%d";
>  
>  static const struct rtl819x_ops rtl819xp_ops = {
> -	.nic_type			= NIC_8192E,
>  };

Delete.

>  
>  static struct pci_device_id rtl8192_pci_id_tbl[] = {
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
> index fa72f8891409..f75cc96052d9 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
> @@ -204,7 +204,6 @@ struct rtl8192_tx_ring {
>  };
>  
>  struct rtl819x_ops {
> -	enum nic_t nic_type;
>  };

Delete this empty struct too.

Otherwise these patches are really nice.  Thanks!

regards,
dan carpenter

