Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9194F814
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 12:18:35 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id lc7so3645765ejb.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 05:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=NM+lxSqjM8oFCbQnG31XvkQ4+xfR81iJOrwKlVfJyok=;
        b=WejafAQQbqcpEnzAtu/PpyOP7fmVQf6gG2x6M2S5Vm7Rg8NWLbgGQ5RpkHCQxTHi/m
         XW85pwdMq8KL2wN2kXynuASuLaPlphzRYSmBlEdwBWZAov0sqMhSiBdBINGTWmKVf5oE
         jQzPXuSJQSkar5SSa5QB2I7o7WFWWJyHyux6NKGKvXGK0YPK6ADoyS5ryOqX9jPuEuzt
         //RIfavaV7baPOK3aYiVw9O+s9Y8p4Lv14IXpOaj42BzbEWvIirNnXoXsyKUBGbViCda
         5s4S9JcGF5Yi4+r8xuBgOKgnuL5LLHpqGPigWXv/5o7quVKeWIHdmqtJTDaiuscpaBTD
         bfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=NM+lxSqjM8oFCbQnG31XvkQ4+xfR81iJOrwKlVfJyok=;
        b=dAvdwWagY8/JOuVVXzq+6RKab9IeaQ0W06ciRWM30NTBAdKvTXEIf/TuRFlN/qI0cz
         Amdkv86almT477w7/5RQ9WyaYsR11H5BB2D4Oek0FqJ4ZIAN3Cqm1gkDMRG7Gr/DZo2u
         Tlo56xnG9tYi3HvZkjLlZfLMDaAYDT3gqznktpLI8at9M9x/1NuzBj91etYxhm7mSWcm
         PdJSf0NFxhCdEC9n16l+iSYam3hGFuNU3UUJfdB7v42Z1IOHdsBMw6xmSbs1nktDaRsT
         DpmazGhonjxISu7QT/VCwSxk4S9jo5x6L5D778kyp7HcFbGjj5oOAtxEOf0WeZjWkGc3
         8vvA==
X-Gm-Message-State: ACgBeo0d4HXSsEZgNV5bC7LOU0mcXfid9fFqCGrwlaNu4TNt3Br+aE8X
	LmGXYCgl1jeQH+JxugE/ufg=
X-Google-Smtp-Source: AA6agR4AHMKVaBWkWEN5wVUo9hiOeUinsMUur891/drAYP2F99sCJd9oJx2G+nFVAs+Re4srAIay6g==
X-Received: by 2002:a17:907:6e8a:b0:779:9e32:8dff with SMTP id sh10-20020a1709076e8a00b007799e328dffmr2532629ejc.20.1662725913877;
        Fri, 09 Sep 2022 05:18:33 -0700 (PDT)
Received: from localhost.localdomain (wlan-244090.nbw.tue.nl. [131.155.244.90])
        by smtp.gmail.com with ESMTPSA id p17-20020a170906785100b0073bdb2f6f28sm167143ejm.217.2022.09.09.05.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 05:18:33 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 1/2] staging: vt6655: remove unnecessary volatile qualifier
Date: Fri,  9 Sep 2022 14:17:55 +0200
Message-Id: <c3a7d9963b1c38c5f493786d7268c430617412dd.1662724786.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662724786.git.namcaov@gmail.com>
References: <cover.1662724786.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove volatile qualifier for the member rd0 of struct vnt_rx_desc,
because there is no reason it must be volatile.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/desc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/desc.h b/drivers/staging/vt6655/desc.h
index 17a40c53b8ff..3f0f287b1693 100644
--- a/drivers/staging/vt6655/desc.h
+++ b/drivers/staging/vt6655/desc.h
@@ -182,7 +182,7 @@ struct vnt_rdes1 {
 
 /* Rx descriptor*/
 struct vnt_rx_desc {
-	volatile struct vnt_rdes0 rd0;
+	struct vnt_rdes0 rd0;
 	volatile struct vnt_rdes1 rd1;
 	volatile __le32 buff_addr;
 	volatile __le32 next_desc;
-- 
2.25.1

