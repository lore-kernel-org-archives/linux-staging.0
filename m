Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E62F37D0A
	for <linux-staging@lists.linux.dev>; Tue, 19 Dec 2023 17:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9CsTvLF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3c394c1f4so12983225ad.2
        for <linux-staging@lists.linux.dev>; Tue, 19 Dec 2023 09:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703005492; x=1703610292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PM3d/NIEm0CgHdjXGgWJHdZqyX/EyowpB1E8sCeJFsQ=;
        b=b9CsTvLFrjcae2wzdZkflFr588qqqhd2RIg/5Pkecjw8wCEKtrLLm5cjAeA+MPVMK4
         a2Z2XvWTumLG4wYJ4ASzLv35qv8LZNvJpotMDhYqQ+fs9b0oTRgeK2hytR9vWy62hlFP
         6aNMudr5eZeuPE8xA3S/auR1FVZ9ctV9F+rdndJYrguB5YxOo8UMoHGGkPixUZ2M0tv6
         O1poZ4RrlVLc27oGUMxIKXPHasHX/NWVrihVjFOaeAK3zZAsABA5Bf3viAoehxRczzIW
         QaNZ/yWmwaSjVRLGtHa3yk0Q83iXmHeg0Jdi0uyTwgK4RWXYC882vc5CRf7t/+/6RKxr
         OZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703005492; x=1703610292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PM3d/NIEm0CgHdjXGgWJHdZqyX/EyowpB1E8sCeJFsQ=;
        b=Q3/3Q7an4cASCjmn42PFBlCNwo13SaRs4KRG9/cjbS1JmsWnIpEjhULdiYXKhwcTju
         Igc/HV7PsXdfsajCJd6W94LAo4Y7VnS+8rcQu+kiZu2Fae7/WCrBMFxoDxoihZ7eJ4Kv
         FqIYx3OjINQQMAq6j9v1lUmMAe8o9XingzAFrM29OUPzEaxkvLR0J14B+tH/x0pMXxe6
         iZ7KWuEqXreKirFRg8eKOmaFosoSbxtlbbyKLlll/rCc3Fj753VNrtJ+7iWhQALRkDVp
         AUyH2Agg177xi+Sq946RCzP1iljoqtr1VuiepSdGFA2tYUhpXTbQ/VsAI274YmEuNPMK
         yUbw==
X-Gm-Message-State: AOJu0Yy4yZNlWasEEX2jN7HDkK34MCjnrD24hdJY9/92PLuDh4bv5qjx
	s32fafe+DcClFPYXH1S9I24=
X-Google-Smtp-Source: AGHT+IHQgNuhzqrQPtNQjBc+osfO174/ED1jJW/wYAuP9su9cJ07/ku+lOPExF3f3YGLZQ1xsJM4/w==
X-Received: by 2002:a17:902:a517:b0:1d0:6ffe:1e8d with SMTP id s23-20020a170902a51700b001d06ffe1e8dmr9592303plq.112.1703005492195;
        Tue, 19 Dec 2023 09:04:52 -0800 (PST)
Received: from yqt-VirtualBox ([223.166.246.87])
        by smtp.gmail.com with ESMTPSA id iz12-20020a170902ef8c00b001d349240e60sm7785817plb.72.2023.12.19.09.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 09:04:51 -0800 (PST)
From: Piro Yang <piroyangg@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: Piro Yang <piroyangg@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4] staging: vme_user: Fix the issue of return the wrong error code
Date: Wed, 20 Dec 2023 01:04:47 +0800
Message-Id: <20231219170447.51237-1-piroyangg@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the issue of returning the -ENOSYS error code when an error occurs.

The error code of -ENOSYS indicates Invalid system call number, but
there is not system call error. So replace -ENOSYS error code by the
return -EINVAL error code.

Signed-off-by: Piro Yang <piroyangg@gmail.com>
---
 v4: change the format of subject and changelog.

 v3: change the description and format for the patch.

 v2: split two different changes,
     only fix the issue of wrong error code.

 drivers/staging/vme_user/vme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 5c416c31ec57..9bc2d35405af 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -341,7 +341,7 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
 
 	if (!bridge->slave_set) {
 		dev_err(bridge->parent, "Function not supported\n");
-		return -ENOSYS;
+		return -EINVAL;
 	}
 
 	if (!(((image->address_attr & aspace) == aspace) &&
-- 
2.25.1

