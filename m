Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5657D2C83
	for <linux-staging@lists.linux.dev>; Mon, 22 Nov 2021 17:04:04 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id v20-20020a25fc14000000b005c2109e5ad1so28671721ybd.9
        for <linux-staging@lists.linux.dev>; Mon, 22 Nov 2021 09:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bdcfOEwSPQXWr0XJgX0JKzljFfsdQQuWPoxIgeWgGLA=;
        b=pywOUcGrj9jYy2ox4jZkiwwgOJ7cfhN1KYhBOelMmiCjdYG9p/EaBms1yRBXuRPN3l
         Pohj6yQqnJNW2wVv/ncHJZ1tamwJ623BXW0ZqW3VLTRteRiRQiyATqZdvj3/giutiPXM
         TtSzx7bCnh3aO0cnPI9DaI8ln+uKGIkyK4DDwINAaNWXs6m8GgosRmZtwo0XBwBRZXUw
         /BU339oVzd/gOBu142kxRHS+d6K4w3J7+OoF5qGn7DqrIzebwlDdXB27Pd7k46Bm4sCF
         L59zCfSaD5DKv8YcpsJUqOdqpMWhqzTzyCede6g0E2c5IUN5BsQYBobY/qbVHWagRcYg
         //Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bdcfOEwSPQXWr0XJgX0JKzljFfsdQQuWPoxIgeWgGLA=;
        b=mu2d6LZi4QGBXHCtnJte98mzH+21j0W2igZtc8VfCOjaJ6IWlUMimomjzdxD6uFcMS
         QMdjuMuJkangacHXogfDCpxA3zxmTFPF+Z02/ELDb6PNmNZQQMJ+YsNQMeJc9HT1UwfM
         s3MzyOzfhxxg0ooNhZiDoHFB8RlJ+q1anc5oet75jsdjuIBdkG0elXzx1ddxrAnrQn++
         zdxy1grzhmQaHZwJ8H+AE4TIWDhBjjoIlHagNYTdXuy7Lai6ekQEyFCoRpl8poRB3w34
         s4pp2g8JwnZt7VpOoQU+fBS/4AZdb+qmIw+gao+D/wSjNjLvbh0la8sIj28LbEy8/qR+
         SjgA==
X-Gm-Message-State: AOAM531sUdF+fZZIPuiQCpm+BgwdZ3ML591w4TZFes7txoGne8cldrkw
	2fLMvQelPHZk0Xab0ky2qhxLmFiNwg==
X-Google-Smtp-Source: ABdhPJw/9zwTqnuQL2LKzyAS8YiZDr6ZSxFI9PQxI9zwi+BGycgwtd5rJwRza8OOymkCpuKcZeMHYJxtPg==
X-Received: from zoebm1.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:e29])
 (user=zoebm job=sendgmr) by 2002:a25:ac42:: with SMTP id r2mr64254480ybd.126.1637600643085;
 Mon, 22 Nov 2021 09:04:03 -0800 (PST)
Date: Mon, 22 Nov 2021 17:03:35 +0000
In-Reply-To: <20211122103931.GA6514@kadam>
Message-Id: <20211122170335.1468730-1-zoebm@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211122103931.GA6514@kadam>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 3/3] Staging: rtl8712: Fixes a camel case variable name
 style issue
From: Zoeb Mithaiwala <zoebm@google.com>
To: dan.carpenter@oracle.com
Cc: greg@kroah.com, trivial@kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Zoeb Mithaiwala <zoebm@google.com>
Content-Type: text/plain; charset="UTF-8"

Changes the names of variables in rtl871x_security from camel case to
snake case to match coding style.

Signed-off-by: Zoeb Mithaiwala <zoebm@google.com>
---
Changes in v3:
  - Fixes commit messages for patch.
  - Uses the same variable names in header file as implementation files.
Changes in v2:
  - Changes the variable name from nBytesInM to bytes_in_m.
  - Removes changes to other variables in the file.
---
 drivers/staging/rtl8712/rtl871x_security.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_security.h b/drivers/staging/rtl8712/rtl871x_security.h
index 1de662940417..81262e68bee1 100644
--- a/drivers/staging/rtl8712/rtl871x_security.h
+++ b/drivers/staging/rtl8712/rtl871x_security.h
@@ -200,11 +200,11 @@ void seccalctkipmic(
 	u8  *header,
 	u8  *data,
 	u32  data_len,
-	u8  *Miccode,
+	u8  *mic_code,
 	u8   priority);
 
 void r8712_secmicsetkey(struct mic_data *pmicdata, u8 *key);
-void r8712_secmicappend(struct mic_data *pmicdata, u8 *src, u32 nBytes);
+void r8712_secmicappend(struct mic_data *pmicdata, u8 *src, u32 nbytes);
 void r8712_secgetmic(struct mic_data *pmicdata, u8 *dst);
 u32 r8712_aes_encrypt(struct _adapter *padapter, u8 *pxmitframe);
 u32 r8712_tkip_encrypt(struct _adapter *padapter, u8 *pxmitframe);
-- 
2.20.1

