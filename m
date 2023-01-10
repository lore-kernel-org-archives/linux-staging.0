Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0AE7474
	for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 14:17:49 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e3so2687955wru.13
        for <linux-staging@lists.linux.dev>; Tue, 10 Jan 2023 06:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vEoA0n+XbnFXFQZjvaPZDMUsN/bZvbipc6qH3L8foZ8=;
        b=Q9b7vzrd1WVzZFDgrpvzLSqne9DGlijoEXUdbrJ5oHLfnFx0+X9GEZ4lfTHuBcZfqa
         a1H9EgpJP9F1GKzxb/YNyVMoDL2lBREdayMuaveikTdz0lZtMGlFDIMUJDIcL5mWK35I
         tl2d3eupFrIM5RXPeHBzVfIpuj08U1k1FgN0hJv69hrPMOqPfPniWC2A0qsjWKbZeXnx
         maNSy8GBW6A0tBRjWnDsbSnPxDO6l9EDj0RnSfpnVDXXhPtdXHdVgAaSxhpjlwpZ+/0I
         6NBd5isSwJq1eUJcbEUYycxHfonp1OBooExoQPr54O7oKvNksPvDKxTNPfY7QigmjrXb
         cGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEoA0n+XbnFXFQZjvaPZDMUsN/bZvbipc6qH3L8foZ8=;
        b=jcLF42Fp1VPZARnS/7SXCfspzJuM4glv9l8QSKztKBr9otv3J3EmGlF5GwT3Ea4v7y
         QAk/NRMKWQhcYui5GLzTs4dd6M8ZTyE1Xo6EXBDHZ1nc8ZcKl6ylHZA4bD7qx5aaWbBv
         +fddP0yd6VDSzHHxwCAJy3eDrhg9E1P6lP/FEQ4LE0FqGsziwgwpNERbkwELYK3eWdAv
         /BHwniAU9vH6Z93DSTAPs5hBTWrClHXMBGcaHfrWLHfwCT7E13qhN6kbc8YBeh9oUlQn
         C0DDbIoTCwPAD+7EXJnZHBlYwxmViKgriJE7tucHSEzJRfS0eDpTD+0Y9Dm2d65oa04B
         qeOw==
X-Gm-Message-State: AFqh2krgGgGEzP3k/VQrzP1YZtF5kY3gIA6IGb1NyrvXg6nS4tkc3fct
	SMbrNc3mnCXKQ5HvqClX3pI=
X-Google-Smtp-Source: AMrXdXvSs2J7Wc5xrZfcYXyfL7VZfTAfd+jYvkVgCZe9CRJN7l7GRDInIxxONdlN8JFci0A/RY040Q==
X-Received: by 2002:adf:e883:0:b0:2bb:6c50:a559 with SMTP id d3-20020adfe883000000b002bb6c50a559mr9662277wrm.38.1673360267245;
        Tue, 10 Jan 2023 06:17:47 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o2-20020a5d58c2000000b002bdbead763csm506753wrf.95.2023.01.10.06.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 06:17:46 -0800 (PST)
Date: Tue, 10 Jan 2023 17:17:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Gaurav Pathak <gauravpathak129@gmail.com>
Cc: paskripkin@gmail.com, Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: r8188eu: Used u16 instead of __le16 in
 rtl8188e_set_FwMediaStatus_cmd()
Message-ID: <Y71zhnbfIWqAPM4i@kadam>
References: <20230110135058.21364-1-gauravpathak129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110135058.21364-1-gauravpathak129@gmail.com>

On Tue, Jan 10, 2023 at 07:20:58PM +0530, Gaurav Pathak wrote:
> - Changed 2nd argument from __le16 to u16 to fix sparse warning
>   "warning: incorrect type in argument 2 (different base types)"
> - Removed le16_to_cpu() in staging/r8188eu/hal/rtl8188e_cmd.c
> 
> Signed-off-by: Gaurav Pathak <gauravpathak129@gmail.com>
> ---
>  drivers/staging/r8188eu/hal/rtl8188e_cmd.c     | 4 ++--
>  drivers/staging/r8188eu/include/rtl8188e_cmd.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
> index 8310d7f53982..a055e71d30ae 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
> @@ -193,9 +193,9 @@ void rtl8188e_set_FwPwrMode_cmd(struct adapter *adapt, u8 Mode)
>  
>  }
>  
> -void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt)
> +void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, u16 mstatus_rpt)
>  {
> -	u16 mst_rpt = le16_to_cpu(mstatus_rpt);
> +	u16 mst_rpt = mstatus_rpt;

You are changing the behavior of the code here for big endian systems.
Either the change is good or bad.  TLDR; I suspect the change is bad but
I don't know.

The mstatus_rpt is CPU endian.  It is the one of two things for connect
or disconnect:

   connect: (psta->mac_id << 8) | 1
disconnect: (psta->mac_id << 8) | 0

So the question is in FillH2CCmd_88E() should the connect/disconnect
come before the mac_id as it currently does or should it only work that
way on little endian systems and be reversed on big endian systems?
My feeling is that the second option makes no sense so this patch is not
correct.

Instead what should happen is:

-void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, __le16 mstatus_rpt)
+void rtl8188e_set_FwMediaStatus_cmd(struct adapter *adapt, u16 mstatus_rpt)
 {
-	u16 mst_rpt = le16_to_cpu(mstatus_rpt);
+	__le16 mst_rpt = cpu_to_le16(mstatus_rpt);

But this is just my intuition and I don't know this hardware.

regards,
dan carpenter

