Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB992C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 22:13:29 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id k7so43772236wrd.13
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 15:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kRNm4UtdNQv+PW99X+CVETEWwDBlU3O2UZG+/c3QddE=;
        b=fjddBJEW/OkoB4qQL4Ro5vzCDwC5h26o38XOXzIXpMrj+5Y94xMarSYrsvrtNgpqzV
         ky9pUmp3W3Udw9FlAxLn3WpiOvedgGeXEBYOrUsozjpKd0ClhQQ0vkpdKLY9a+CyxTgt
         FTqE3vknxO5C0UrpM2NNTLi0E3smsUkapmlnge7HbaPwEgdr0cT2r49+aQBsHBJ38dmx
         Y7qHre0tRD/ZlaOucPUdVZSe5kmU3COgtyoC1mbbh/1PRfsx64wKXlMFeYSDuQh6aKGT
         yywRXTU/GrwD1q+HVLtiCZJ/n1cd9YkbcoDpIAbg88qOGO54RVH2QiOTH1PhGn6cWIVb
         xF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kRNm4UtdNQv+PW99X+CVETEWwDBlU3O2UZG+/c3QddE=;
        b=b8TlX2WGtVO1nPaHNyN/mNTi+j8BV1w9zX/iV2lOO1Bx9GvlQgJ2Op+4JrKuwHVkWY
         KYS+B4X3rtDYuPHP+KSAN9JvAjDFOBBOkZhMKg0W+hfAwpPbNxsjD2TdYXgbb23MAGIn
         y8wTPHbYoWBs4LpIt2BQVQASxLp+RD7bOFg9BOKe73TIwZ29jkcuw9nlWqrIsyXO8jbS
         bpRJZE6A5VwKzUeg3MYQCp04jXB0npFQJ/lZuVIhJTdT0ISd51N8O1pYezXD60OtrVje
         o7ZxvdnR4VJYdbHuNINLQ5YAZyt17vpCG0scO2eHHh3K9iFcLfy0IumslNix5Rx/t/yk
         WjxQ==
X-Gm-Message-State: AOAM530AtafBVCap+iJZgXWL4VzXuU4LEQl2qzPB0eNhGKeik08qym+v
	4OCJr0W71IadxTDGZYFCzlg=
X-Google-Smtp-Source: ABdhPJylOQCdtsGopOI5UCn+0xnPACYs2rc0/Oh50iHHgDQ72g983PEMwdSlggVivRWyGD0vdyWw1Q==
X-Received: by 2002:adf:f60e:: with SMTP id t14mr18554206wrp.373.1634595207440;
        Mon, 18 Oct 2021 15:13:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3de4])
        by smtp.gmail.com with ESMTPSA id k8sm683484wmr.32.2021.10.18.15.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 15:13:27 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: fix a gcc warning
Date: Tue, 19 Oct 2021 00:12:31 +0200
Message-Id: <20211018221231.7837-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strncpy with strlcpy to fix the following gcc warning.

drivers/staging/r8188eu/os_dep/ioctl_linux.c: In function 'rtw_wx_set_enc_ext':
drivers/staging/r8188eu/os_dep/ioctl_linux.c:1929:9: warning: 'strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
 1929 |         strncpy((char *)param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME_LEN);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The destination buffer size is IEEE_CRYPT_ALG_NAME_LEN and the length
of the string to copy is always < IEEE_CRYPT_ALG_NAME_LEN. So strlcpy
will never truncate the string.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 51f46696a593..4f0ae821d193 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -1926,7 +1926,7 @@ static int rtw_wx_set_enc_ext(struct net_device *dev,
 		return -1;
 	}
 
-	strncpy((char *)param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME_LEN);
+	strlcpy((char *)param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME_LEN);
 
 	if (pext->ext_flags & IW_ENCODE_EXT_SET_TX_KEY)
 		param->u.crypt.set_tx = 1;
-- 
2.33.0

