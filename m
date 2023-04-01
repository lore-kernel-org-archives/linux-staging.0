Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEED79DE;
	Sat,  1 Apr 2023 18:58:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so15801842wmq.3;
        Sat, 01 Apr 2023 11:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680375530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4O3XZtJ4K7opusRPJDG2obDOo5CziuFWNMf3s6wXVg=;
        b=hoW50hi2hMW8Al6S0cBLHk2xdT2gqsg+gpVk0IpgM081rXOQSiqyLbN+oclzkOGWXj
         b1TfC4rA0iMsAdd4jzdVP41ZOBmt9wUvaX8S6o6+f4bwZMiItZECrOQc7tjOF20c3s/S
         6aD7WWjT7+1t8K3r9RXq/nyULZglBqrozReWzR7GrYNdTEvwdcKwOjjQOwyeP6eASCQr
         /FYHtrCifF8GGVeG0AU/F1cPVX7osh/INB0wxeYbc5PqoOQYJ1rONOnIyxWVpORn9hXL
         yhrQWhdkLxFM0uO7gOm621TSGP8AyUqeLmyrA6552EfLvgnrXtULLss5a8LCDoJD6AYf
         wm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680375530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4O3XZtJ4K7opusRPJDG2obDOo5CziuFWNMf3s6wXVg=;
        b=Wo5Lo7cGkYeodIx1HTpSn7Rq67u/Fk6sgYt0g4aww3NaZlM2S6hj2UxmyO6ldtqN/S
         pBXHbQLfP5Hp+5dQQ3fXvTdZ2q6LOR5WzijGZUXVhKto+qlLUdqD5XFKo8RSORTk0ZsI
         uua2X9QhqDyy6/jzz46F+SG10Z/oZHw2i2PuLPE383GTmy4qBdhDtPc0T4wyG0Q1Jtct
         P4Ov6Aq6a7uyxJto+Xm9glpwUiraHnRxai4wE7e9f71cHEwvnEqJ8d1N5+kk9Ni07frI
         BdC2sDjrLtsxwPc9Q2uzhOLGk6Y1u8cDaMHT98RckP3KOxadB12XPB5wm8EsVK7mXQkP
         STAA==
X-Gm-Message-State: AAQBX9dnRGsmMik9bbRIUkau5eEp3dWi32hdt7jy7+TH/j41yP6ps6js
	vNUgpbFHBcdt6jfTUAMZ7caQBiobS3AMYGW0
X-Google-Smtp-Source: AKy350aQlYfD9YnJLLdnlOfvG/XCbSRUS/RxcGzEgKUbLX4Kv+YjT2tUqIDg1nePu48TFIPNvR2I5A==
X-Received: by 2002:a1c:4c11:0:b0:3ef:6ea4:a675 with SMTP id z17-20020a1c4c11000000b003ef6ea4a675mr17267044wmf.36.1680375529730;
        Sat, 01 Apr 2023 11:58:49 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id s17-20020a05600c45d100b003ed51cdb94csm14017463wmo.26.2023.04.01.11.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 11:58:49 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] staging: rtl8192e: remove extra blank lines in rtllib_crypt_ccmp.c
Date: Sat,  1 Apr 2023 23:58:40 +0500
Message-Id: <283265f6a5ff938f8425e14af86cee9e2da36318.1680375200.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680375200.git.kamrankhadijadj@gmail.com>
References: <cover.1680375200.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove extra blank lines as suggested by the Linux kernel coding-style.
These issues were reported by checkpatch.

"CHECK: Please don't use multiple blank lines"

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_crypt_ccmp.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
index a8d22da8bc9a..eb7b6deb2ca7 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_ccmp.c
@@ -74,7 +74,6 @@ static void *rtllib_ccmp_init(int key_idx)
 	return NULL;
 }
 
-
 static void rtllib_ccmp_deinit(void *priv)
 {
 	struct rtllib_ccmp_data *_priv = priv;
@@ -84,7 +83,6 @@ static void rtllib_ccmp_deinit(void *priv)
 	kfree(priv);
 }
 
-
 static int ccmp_init_iv_and_aad(struct rtllib_hdr_4addr *hdr,
 				u8 *pn, u8 *iv, u8 *aad)
 {
@@ -150,8 +148,6 @@ static int ccmp_init_iv_and_aad(struct rtllib_hdr_4addr *hdr,
 	return aad_len;
 }
 
-
-
 static int rtllib_ccmp_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 {
 	struct rtllib_ccmp_data *key = priv;
@@ -220,7 +216,6 @@ static int rtllib_ccmp_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	return 0;
 }
 
-
 static int rtllib_ccmp_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 {
 	struct rtllib_ccmp_data *key = priv;
@@ -315,7 +310,6 @@ static int rtllib_ccmp_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	return keyidx;
 }
 
-
 static int rtllib_ccmp_set_key(void *key, int len, u8 *seq, void *priv)
 {
 	struct rtllib_ccmp_data *data = priv;
@@ -349,7 +343,6 @@ static int rtllib_ccmp_set_key(void *key, int len, u8 *seq, void *priv)
 	return 0;
 }
 
-
 static int rtllib_ccmp_get_key(void *key, int len, u8 *seq, void *priv)
 {
 	struct rtllib_ccmp_data *data = priv;
@@ -373,7 +366,6 @@ static int rtllib_ccmp_get_key(void *key, int len, u8 *seq, void *priv)
 	return CCMP_TK_LEN;
 }
 
-
 static void rtllib_ccmp_print_stats(struct seq_file *m, void *priv)
 {
 	struct rtllib_ccmp_data *ccmp = priv;
@@ -403,13 +395,11 @@ static struct lib80211_crypto_ops rtllib_crypt_ccmp = {
 	.owner			= THIS_MODULE,
 };
 
-
 static int __init rtllib_crypto_ccmp_init(void)
 {
 	return lib80211_register_crypto_ops(&rtllib_crypt_ccmp);
 }
 
-
 static void __exit rtllib_crypto_ccmp_exit(void)
 {
 	lib80211_unregister_crypto_ops(&rtllib_crypt_ccmp);
-- 
2.34.1

