Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4AB72
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 17:00:59 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id me10so10058573ejb.11
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RKZs89fuLtkQSgv1rIGCp+G5BzMsQVDBKa5KYJGPMQo=;
        b=K9CflRAQPex0Z7F1fAvEEA2mdF8YNHHmNQQYm29NT45BWXaHVee+6I4k+JHaeFJnCF
         fOsw2vwSUW6G8KaIRtsNKklVkmnz9yvqAWOcyWK1PC87F72KKwE/8H+Q4f3coCCyNwI1
         8jMgukxYManP5YW7qO19MEeVYgsD3WoT/T1SK4q39kH7uck3n8Cpt5yPvM53rl2oz8VV
         OKbrCFSG92e/16eglZRKzh4/uzkrPdTkRBHGnDJ1iU7PplBuJNwS2fCjxo4TCN2FXBfR
         T/g6AXZ8xkozSvJStYIMb+OQE81eX/829yYB5kN0J9w1RXWdiF6vhID1Nl5hEejTkVgh
         lFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RKZs89fuLtkQSgv1rIGCp+G5BzMsQVDBKa5KYJGPMQo=;
        b=kEIAumKdaYDP9JCAcTxeKz9ddz4bwt0IXhbGa3iXlg2Bi+L/KZiob7pqKvrLDo70ai
         oyV8Ps7uFw4EJrdrMdG8iYCr2uElUL21+ZlaI9nAbQbW7gf53wgS7RJ81Wp/mHKsLA5G
         p+96HZmBHT082FfmArMvrDYiT/BrPMnhCXSgVdL0fsNGrFQYfOnFxW8gSgvkJZBd/OGG
         x/wZV7SoApCzPTjcs6fXe2aytZisDPKgsAEboMU1KufdkrgpxAclr6UxhGFQRGQ44oFp
         JwMFf1H6AFlz2ejwEZdrLjdPNqoiqnz8V3K0PnJ65fi6D71FmNl/xo3bL02jaAPCPCdv
         P7XQ==
X-Gm-Message-State: AOAM5303IPubCYyyceEN+6PN8QApCcayxe2kyszHeDKaSPO3Cp9Zyo72
	sxK5K0uTtt2VstqkAB9gZt4=
X-Google-Smtp-Source: ABdhPJxCgMILpou0Z6NZmL/OByXrMkntRIc3Eqde5F/pUwWMJ1KIf9eBp6Vhk28N5ztcwUrBtwSZAg==
X-Received: by 2002:a17:906:5408:: with SMTP id q8mr37220563ejo.54.1629738058019;
        Mon, 23 Aug 2021 10:00:58 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id b18sm1633188ejl.90.2021.08.23.10.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:00:57 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] staging: r8188eu: incorrect type in assignment
Date: Mon, 23 Aug 2021 22:30:30 +0530
Message-Id: <876b83dad76a6f561879da0db1fbb25b251374d4.1629563318.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629563318.git.aakashhemadri123@gmail.com>
References: <cover.1629563318.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
> rtw_br_ext.c:516:57: warning: incorrect type in assignment
    (different base types)
> rtw_br_ext.c:516:57:    expected unsigned short
> rtw_br_ext.c:516:57:    got restricted __be16 [usertype]

*pMagic holds __be16 change it's type to __be16

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---

Incorrectly removed htons() to satisfy sparse warning. Instead make
pMagic use the appropriate bid endian type

 drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 83a4594a4214..14cf13516d34 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -474,7 +474,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 		/*                Handle PPPoE frame                 */
 		/*---------------------------------------------------*/
 		struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
-		unsigned short *pMagic;
+		__be16 *pMagic;
 
 		switch (method) {
 		case NAT25_CHECK:
@@ -512,7 +512,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 						tag->tag_len = htons(MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN+old_tag_len);
 
 						/*  insert the magic_code+client mac in relay tag */
-						pMagic = (unsigned short *)tag->tag_data;
+						pMagic = (__be16 *)tag->tag_data;
 						*pMagic = htons(MAGIC_CODE);
 						memcpy(tag->tag_data+MAGIC_CODE_LEN, skb->data+ETH_ALEN, ETH_ALEN);
 
-- 
2.32.0

