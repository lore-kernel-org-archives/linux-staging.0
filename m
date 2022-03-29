Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AFB257F
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 17:00:54 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id b15so21429746edn.4
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 10:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BPKs3suq1SgwSX2Q9VZX8LKJW7ayWPXQUfm1Ivff7Yg=;
        b=F/2SYHD88iDJ7+pjQBONixePXir6QXcvw8CfxAJqR8XP7+Y5PhUSIgoAqVmMU+jmbc
         hIPpXnmU8FZa3G85hY6f9oG77VaQi2vhrO/Zx1Hl1Ol4nJVnRESIZYT0MKxpQKG20myz
         ijUqrtKbN4pUIXFBR+koaQg5nqwRuQu5piJeJGZpzEjKvVEeflBtxdf3oFnSBIyhfAX2
         HZfmlTC32O0zmhEnDWeCzyLVQtqpXMBysZSbn06xzxq5mhrTTylJSOxMOdJ/zk0zxoM9
         NVxMaVbzHV/L4I3ppSWTxUauBVImumSbms90mWkBvL/TqeknNzVaXhbf34czzAJqjgJn
         7upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BPKs3suq1SgwSX2Q9VZX8LKJW7ayWPXQUfm1Ivff7Yg=;
        b=VJOj0OD1kNbxoaek7G4AcenT6FMIluBkuMnmqxF+1XTsOp8uzhSYMHlxTIRzfXvWhE
         vyTLq07cJ9j26NtpRyUHDm8wwYfPufyFjLwjH0U0VOQHXxYWKyUV4P/py4aByntJf1WI
         tHcYSW/KiJ7AUVbcALnSn7nKNymrTBMqvpXWTwrdfmOIzGnRkL0Ieq3GUP5fs3utPncg
         w/QKEicorpAYlQD83vJ2qDaiCdGEopZ/NSeSOqn82Ye0C5JhSWUVOpa27hwl56dZKg4D
         1prvLt9VidZLiBxe25WYVvKFfbtm9+CKA6/ceL2G0sXNkNGsPuGKDICSXy3gNbaiF7PH
         CwMw==
X-Gm-Message-State: AOAM531uKSopVFx/WzEzb/xPEhJqYx8SWLs5A70fpTkcAS40AAIivMTp
	N9ELt05dWEzrmfcwmED7mXc=
X-Google-Smtp-Source: ABdhPJw37lXtVfuQrFwFlV0EXWgi+RpMtuLezJR109NVeOyq7+/UWRXue9+RusATHM8TRMeZnCqahA==
X-Received: by 2002:a05:6402:914:b0:419:a627:ef6f with SMTP id g20-20020a056402091400b00419a627ef6fmr5731279edz.67.1648573252351;
        Tue, 29 Mar 2022 10:00:52 -0700 (PDT)
Received: from leap.localnet (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id p10-20020a170906604a00b006e07c76f3d7sm6851961ejj.210.2022.03.29.10.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 10:00:51 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dan.carpenter@oracle.com
Cc: David Kershner <david.kershner@unisys.com>, sparmaintainer@unisys.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: unisys: Properly test debugfs_create_dir() return values
Date: Tue, 29 Mar 2022 19:00:49 +0200
Message-ID: <2030244.KlZ2vcFHjT@leap>
In-Reply-To: <20220322083858.16887-1-fmdefrancesco@gmail.com>
References: <20220322083858.16887-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

On marted=EC 22 marzo 2022 09:38:58 CEST Fabio M. De Francesco wrote:
> debugfs_create_dir() returns a pointers to a dentry objects. On failures
> it returns errors. Currently the values returned to visornic_probe()
> seem to be tested for being equal to NULL in case of failures.
>=20
> Properly test with "if (IS_ERR())" and then assign the correct error=20
> value to the "err" variable.
>=20
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/unisys/visornic/visornic_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/unisys/visornic/visornic_main.c b/drivers/st=
aging/unisys/visornic/visornic_main.c
> index 643432458105..58d03f3d3173 100644
> --- a/drivers/staging/unisys/visornic/visornic_main.c
> +++ b/drivers/staging/unisys/visornic/visornic_main.c
> @@ -1922,11 +1922,11 @@ static int visornic_probe(struct visor_device *de=
v)
>  	/* create debug/sysfs directories */
>  	devdata->eth_debugfs_dir =3D debugfs_create_dir(netdev->name,
>  						      visornic_debugfs_dir);
> -	if (!devdata->eth_debugfs_dir) {
> +	if (IS_ERR(devdata->eth_debugfs_dir)) {
>  		dev_err(&dev->device,
>  			"%s debugfs_create_dir %s failed\n",
>  			__func__, netdev->name);
> -		err =3D -ENOMEM;
> +		err =3D PTR_ERR(devdata->eth_debugfs_dir);
>  		goto cleanup_register_netdev;
>  	}
> =20
> --=20
> 2.34.1
>=20
Hi Greg, Dan,

Now I have time to rework this patch but, if I'm not misunderstanding, you=
=20
asked for two contrasting works to do here...

Dan wrote that "[in] this case you can delete the whole devdata->eth_debugf=
s_dir=20
and the related code.".

Greg wrote that "We really shouldn't be checking this value at all.  There'=
s=20
no reason to check the return value of a debugfs_* call. Can you fix up the=
 code to
do that instead?".

I'm confused because they look like two incompatible requests. What should =
I do?

Thanks,

=46abio M. De Francesco


