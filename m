Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2527B;
	Thu, 31 Mar 2022 07:01:05 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id m30so32333415wrb.1;
        Thu, 31 Mar 2022 00:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kSVb1dTbWdbne8U6VvmE51Q2krf82Epq6ExE1DUNwlY=;
        b=DWwExqt6wOKpB5leH0YrszfY4BBOcAmwKWK3k3xC8z8e3PXmH2PV8rw7gkliIKYfYT
         YGcBgvBEmCwLigZ8CW8xgyRn+gx82i8csj/m8AzVx9MonCoVLLvo8bCJwMzEiS496oft
         GvpunYLmNbKAs8mZL4KSAxIJZvc/3srBuPY+/2Q8kOIolZ91IWFOg0Bq8qSPL6AmJKTo
         W/TBtzfmNxYjQAvzlw8mEEc4phADplW4qxzOFr7V6DxqNobma2+MH61VJSbUqzMNGEGV
         B048JowqMWFaHg0uup350luMdndFk+UtyJxvESamR7b0WLTDnWkc5Cy9tfFc+ovLDIcN
         NZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kSVb1dTbWdbne8U6VvmE51Q2krf82Epq6ExE1DUNwlY=;
        b=kUP6OLMNYaWN+Ykq0ySphkWDwz8AokunA2RyWXnj3ceeP8yrhzTztufJqUag4eaLjd
         ZNpPoh1HqX05b/JBeZ67fiZ6WecoyIvkkbmK5QikJoa6/n+4eUJ4TUwLn1Nzm+ckAHrI
         r5fXNNiU34LuE7c8w8Lhg5ATZKzw580pazur0gP+8TsfK8hufFQibMkNFphfQebmDNpI
         EG2P4kvKV/79Xuvea9Cy8+puz92+8xwu603fNVj3BAjyuHac1CD/g3dqp5wL1vm8u8dH
         jwOwL3Pdn8s+5aWO0dLRnR+yXqVwatTRKeKEuOvAPc/Vy+UnXo/5mJs1ue96UUkabrW8
         VXdg==
X-Gm-Message-State: AOAM531iHL6KKphC23OyoQ/watmNiz/iFRUorsTEn993GTxs/jpuhZAR
	+YHZcIc9YgcBzwVHLjihNqo=
X-Google-Smtp-Source: ABdhPJyVQ+8U4h+ZzHr7EWX8iqE5z6jQcrTABOrQQenrmyRHHZPiTBRsumyMbVJb1jBTKWKM7T0Y2A==
X-Received: by 2002:adf:f102:0:b0:205:7d05:d250 with SMTP id r2-20020adff102000000b002057d05d250mr2943236wro.350.1648710063300;
        Thu, 31 Mar 2022 00:01:03 -0700 (PDT)
Received: from leap.localnet (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id j15-20020a05600c1c0f00b0038cabc63721sm6875058wms.30.2022.03.31.00.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 00:01:02 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparmaintainer@unisys.com
Cc: David Kershner <david.kershner@unisys.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] staging: unisys: Remove "struct dentry *eth_debugfs_dir"
Date: Thu, 31 Mar 2022 09:00:59 +0200
Message-ID: <2098282.irdbgypaU6@leap>
In-Reply-To: <20220331064751.29634-1-fmdefrancesco@gmail.com>
References: <20220331064751.29634-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On gioved=EC 31 marzo 2022 08:47:51 CEST Fabio M. De Francesco wrote:
> There is no need for "struct dentry *eth_debugfs_dir" which is used for
> debug / sysfs directories. Therefore, remove this "struct dentry" and
> everything related (i.e., creation and removal).
>=20
> As a side effect of this change, the code has no more need of the
> "cleanup_register_netdev" label, which can also be removed.
>=20
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>=20
> v1 - v2: Add a couple of "Suggested-by" tags which were forgotten.=20
> Thanks to Dan Carpenter and Greg Kroah-Hartman.
>=20
>  drivers/staging/unisys/visornic/visornic_main.c | 17 -----------------
>  1 file changed, 17 deletions(-)

As said some days ago, the email address of David Kershner at unisys.com
is not anymore reachable. Each time I submit patches for this Unisys'=20
driver I get the following message:

Delivery has failed to these recipients or groups:

David Kershner (david.kershner at unisys.com)
The email address you entered couldn't be found.=20
Please check the recipient's email address and try to resend the message.

Is it the case to remove his entry from the MAINTAINERS file? I'm asking
because I don't yet know how these kinds of issues are handled.=20

Any suggestions?

Thanks,

=46abio M. De Francesco



