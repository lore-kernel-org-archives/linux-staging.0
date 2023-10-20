Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CE8801;
	Fri, 20 Oct 2023 01:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZ7poTfE"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cac925732fso815385ad.1;
        Thu, 19 Oct 2023 18:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697766937; x=1698371737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMzmo97xwNjH5jtNMKKmAOrNQfA+P+FBFZkUHoft9Wg=;
        b=BZ7poTfEiz7EfwQIWt5gxPCBjxNpZEs5G8D7io6NMN0Q3VmfIeRXfdugzGG8u4yYaG
         I4c5ws2mm37qSyM4I+y8OWZZ+vkDV/uXhiW2Jny1WISTHsM4RBx1nmxsSaIlBbYJvSXQ
         l66z84tNBgBNFdRjaJNf/E8FgmlAyWlkfcEGecpgDlNx7XbyvIuC8CtpPmvssumL3Cn9
         ymGmPiaAqTm3qQsRmf5vz10+8ZPAbTGBVMHmy/ufSNarUNgBLIC4xdHFdj+kZk00SWct
         LdDxsfy9WBBYvk+JEs6nG3ZR0tu0tkcr3zeJCvfv0wMy/8qHEUn+fdvVq9neqm2xzV1t
         LEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697766937; x=1698371737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMzmo97xwNjH5jtNMKKmAOrNQfA+P+FBFZkUHoft9Wg=;
        b=a+Lp7Mg5DA2ddsMrgSHpsFtWv7I5cXcmRg4HcnfRttU/jqFk2JeMu1IAmZ2NibpLxw
         8HdIUSlu2OJ9j7CneX5OkeyUACRz6fWvdovfVGfHZSXMp6GMZVUwAEMytigG4SYgF3VR
         SbmFjlfzGkRsRG6KjGUaX4//Hrjez26HkySSP3ifNvPus6QlQYnJkm/laN+k1kjA7qht
         RhKgBjzEjSQINs5yutN1zPzxdtoTTZ1IvKcyHliOXWqU8iZBusd5FqX2d/P6aOMv6WPe
         Fui5h6mYcs4fV5TM01vEUMGExYJoN2Fln6ybUbI12AgimGVQyQhFWt+dsFJfFbbPwmJn
         HXeQ==
X-Gm-Message-State: AOJu0YwhH6IOIz8LpN/QGLoVdOHqm8UR6hnAkllb1gQ4rO1WcVDynHOg
	wb/JQCG+vofKd84iC+XGU+c=
X-Google-Smtp-Source: AGHT+IEuJG7Enp8orPswkJyxWi+u1vgII7qZFIjb75ydntgjSY50fp1yxUsNF25o7HCwTzCabDgQBg==
X-Received: by 2002:a17:902:e741:b0:1c9:c951:57f9 with SMTP id p1-20020a170902e74100b001c9c95157f9mr441368plf.68.1697766937089;
        Thu, 19 Oct 2023 18:55:37 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001b8b45b177esm355544plb.274.2023.10.19.18.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 18:55:36 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	julia.lawall@inria.fr,
	Andi Shyti <andi.shyti@kernel.org>
Cc: outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH v3 3/5] staging: vme_user: Remove printk() in find_bridge()
Date: Thu, 19 Oct 2023 18:55:21 -0700
Message-ID: <028725ebbc522f73c39f5b1ec4cc2bdbdf588971.1697763267.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1697763267.git.soumya.negi97@gmail.com>
References: <cover.1697763267.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't log error message in find_bridge(). The printk() triggers a
checkpatch warning:
    WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then
             dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...

It can't be replaced by dev_err() & using pr_err() is not helpful as it
doesn't give much context to the user. It is better to remove it.

Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/vme_user/vme.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index c36c2dc095c5..5efcdf15a068 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -62,7 +62,6 @@ static struct vme_bridge *find_bridge(struct vme_resource *resource)
 		return list_entry(resource->entry, struct vme_lm_resource,
 			list)->parent;
 	default:
-		printk(KERN_ERR "Unknown resource type\n");
 		return NULL;
 	}
 }
-- 
2.42.0

