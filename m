Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C2A4E1AD;
	Mon, 11 Dec 2023 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuJJIvrO"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-286d6c95b8cso4652722a91.0;
        Mon, 11 Dec 2023 09:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702316177; x=1702920977; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPdVH85PHNtuHkJ/XiXbqX9ARcJdxzQjA4e5Iwg8PSI=;
        b=DuJJIvrOlB6oX/9MlaQe0P141yUC+/JCqYlT8DHPBoS1QgxVrybM63mOL2HjlPt+B9
         065ee7c0nhG1mOcg4pjNN8kXumpnb/hPAzwVhBTxCN9WkO1/te/aRFmXYXyxs8QBm3VJ
         Uz5ORSCg2Yaj09TTNf0Ytryh4qnBk5mkt4CuqMOSpaHIKqufoJyey/gUT1xyUmrlrE18
         1GdmMMRQko4CprBb1GCfyNqOjDXtUMZ1eX4FQjDjxbGpuuTNgcdav6imwgofq07adrSL
         L5Pm5+Kg87+HaaIKEHCOYSScnKFqzl9ZmE4r3whUih2naCanTd980NXmSiBD9xY8E62X
         8GCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702316177; x=1702920977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPdVH85PHNtuHkJ/XiXbqX9ARcJdxzQjA4e5Iwg8PSI=;
        b=lCJWD7qxt3MpM+3AGkJHNpV+LKEscReThl9VbmMbZ4aQUVNsnDAG5/ZK9Zz6vOri5/
         0JyyKLFxiZ2wGQHAYzY/r6wwvKsWeMvdNk2T76sew4tqIIx+NbBSp3AKBXK02SIhqCGG
         eaOfIyX9Ja2LfddDz4hEN5NedtTPXUJrkNYpZFcOCXjXZGtPxltmcwiaWRkdWB88HUEY
         BsERBu7DTkW2BMYO2Iv/wjzAkj240YJ4uRH9aLoSb5olr3bXpMWqNUVs/+MEY3ZTcKXh
         TPtKHMHvdexc3+fWzeIk5wEj3WsUJ8NtJuD6tT/bX/KAcgKgh9dYvKkjtW77QjrDuSeO
         Bl5Q==
X-Gm-Message-State: AOJu0Yxf3jrl34OL/kuMX4/CwPtp1Uo8OLiOd+O1ni6VI+w0pNFMJ+VA
	U+wCLeVNRdN/GxVtTnwN43k=
X-Google-Smtp-Source: AGHT+IH/W/nbswz7bhHu2QiqSHXIYb5UCTsYZ0FXUQ5NvIRoPZBU0dkpIWMTXVMkKtN0uXyArYbiPQ==
X-Received: by 2002:a17:90b:3803:b0:285:d32c:670f with SMTP id mq3-20020a17090b380300b00285d32c670fmr3641131pjb.10.1702316176759;
        Mon, 11 Dec 2023 09:36:16 -0800 (PST)
Received: from yqt-VirtualBox ([223.166.246.87])
        by smtp.gmail.com with ESMTPSA id mm22-20020a17090b359600b00286901e226bsm8776565pjb.28.2023.12.11.09.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 09:36:16 -0800 (PST)
From: Piro Yang <piroyangg@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Piro Yang <piroyangg@gmail.com>,
	linux-staging@lists.linux.dev,
	Linux Outreachy <outreachy@lists.linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging:vme_user:fix the issue of using the wrong error code
Date: Tue, 12 Dec 2023 01:36:10 +0800
Message-Id: <20231211173610.106501-1-piroyangg@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

the error code of ENOSYS indicates Invalid system call number, but there is not system call

Signed-off-by: Piro Yang <piroyangg@gmail.com>
---
 v2: split two different changes,
     only fix the issue of wrong error code
---
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

