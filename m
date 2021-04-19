Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D082F9B
	for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 19:16:45 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id m6-20020a17090a8586b02901507e1acf0fso3616579pjn.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Apr 2021 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0WK8M0c904A+vC9fiAqfVaCp4aJcCTHCS/P40/Etu8g=;
        b=pJjBX/ZKn2oFj5S/D7unyBaOimlqx3++WSKnGiNkDS42f90dJWWpiN8LGKIcqVIbrr
         V+er0hwoPmFvwNdZPuIR8QjlwK1FjUS7ce34HtpjSYQmgdRddJnavfXve9ePJCQQyVCS
         qZX5wdcaVFrBzl052K32foSw56SJoYfg3am7SlklOkIKY9WWsjokTIF2zEH2WOwhMEb5
         skzBBR2Qbl3NVPmQ67qjlQaDSYP+9Q0B4zo52dL3eeI3qHsDPSp/7t3vToBY/VQn52Bd
         EfUDcF/SDPEU/5FX3o4qB+0hFKHnSW/8CSqqwuRcqCxdOUMT8sk+3MSkp8ij6DD58PHA
         1HRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0WK8M0c904A+vC9fiAqfVaCp4aJcCTHCS/P40/Etu8g=;
        b=q7Wpn2tAyVXEf4siZKE74JX+HX74+qtQ7ihekroRhSqycw9MlRSHnDig6FExAv37Cz
         go8w68HDC+cWOc1WtLUtt6FXDQdcCdfDZuWhAFou9/SCVRZ1SAivRhP3dNB/9EvA1CHR
         Uh0yjm9XQDz4iAcfUqnw6Yk8QcCmtqjDRSDSszxjpn/tW3X0npGIKgOFrmaia13wMGn+
         7PIgcCm91Cj7fFtwv1bDUGs95i+8pB+yO/9SriODoWZzmFqQRLkyTPDxcrfk75Rcac0/
         Swvfqz2EuSgcgMpH3EUdmgDyoaOvsBwyIKpXy3JVOLD2o9/8uDXwUqZG/n05Pe0E/KFM
         N15A==
X-Gm-Message-State: AOAM532Lbun/BYW+M6iFGoD2TUMFfM4a8IEWyMRFjK2Zg4mmn0wPywPC
	+vuvg1WQh0B21Lf6qEdk9VE=
X-Google-Smtp-Source: ABdhPJwfsaXul7oKNLaJXV7dO4RfRtUP23mpUHlOwgwJ/1RCFZSk0X8QLXmIDOQz2h0+bU8beBi5Fw==
X-Received: by 2002:a17:90a:ca83:: with SMTP id y3mr653074pjt.191.1618859805475;
        Mon, 19 Apr 2021 12:16:45 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id o16sm7196271pfp.215.2021.04.19.12.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:16:45 -0700 (PDT)
From: Deepak R Varma <mh12gx2825@gmail.com>
X-Google-Original-From: Deepak R Varma <drv@mailo.com>
Date: Tue, 20 Apr 2021 00:46:40 +0530
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: mh12gx2825@gmail.com
Subject: [PATCH 6/6] staging: media: atomisp: use printk with KERN facility
 level
Message-ID: <4947abeebc2cecca43137675519a2fb48577d3e5.1618859059.git.drv@mailo.com>
References: <cover.1618859059.git.drv@mailo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618859059.git.drv@mailo.com>

printk() without KERN_<LEVEL> facility is flagged by checkpatch as a
warning. It is better to use pr_info() which comes with an
inbuilt KERN_INFO level.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index b572551f1a0d..a0f3c5c32f94 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -1020,7 +1020,7 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	printk("%s: before gc0310_write_reg_array %s\n", __func__,
+	pr_info("%s: before gc0310_write_reg_array %s\n", __func__,
 	       gc0310_res[dev->fmt_idx].desc);
 	ret = startup(sd);
 	if (ret) {
-- 
2.25.1

