Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E286D00
	for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 14:20:56 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id u17so13062587ejk.2
        for <linux-staging@lists.linux.dev>; Sat, 10 Apr 2021 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xAzntwCjbfe9pzWMYCSEN3auSSVZ1kv4hnQXcYCWrcE=;
        b=kDa+SBSjrsDy7Oi9FFv8lvSn5MJ9rQvI+y3x+1FIB7KRVq6uoCg5akmjXRaehT7gUK
         b9vCBpMRnePpMcNCoL4JNBU/JCAft26kPW+gbkWx81y4X8CED+1sbd5iCmZ2cXXqiDi/
         LZw9dCibHwwrvufZwxxk6ZdWXZ3e9PbyXhjZSAo2pXe1W2iU1ogo1QgElQJFmiU7b+6a
         u3A9g0+NVuyNwQSv9yQn0/EuU9hhqGu7MrpmtG9LFZJqVrcxh5ejhCZy0IjoOLSQo1l2
         GJ3oNJeIUO4D79OmSMdJUx1PbK462chUoF4CjrK0JLzlvk/tICdvWJMaq+WyX/ra/hWD
         /bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xAzntwCjbfe9pzWMYCSEN3auSSVZ1kv4hnQXcYCWrcE=;
        b=t/nzKpv3714GkcybwLrWPKSyhwuYN5iCE/ool+Ha4Yxe3lKwlS33LWEgVVHB6WyMZ4
         n7KGdDf1SJd3zjjX53MnH7v58ngyS3YRw8cvTZN1N0vhlCAI8hQ3/r1z8+874ElMZHeY
         XMYF9dH370DNwIoGJk64+Px18vtJarMZLen/8sn+NhfSjJ5Sh/jG0hWajbqdLW8Fk0v7
         zblPp3GcjQKeH1NUiCUXoAN88vEI5UQT10IzfSVuekRt+tk5BCZBW0Hn1e6c93w3pApu
         4j9KVC/S9bEnmgIqlFW+unzKqwcNoX7g3X7Xs5jkrIK/bDZhD6Nm8fm31TD1gKwr5n8c
         SBxw==
X-Gm-Message-State: AOAM5317kg6p61hbuT57EJ3h2982vOSnVXXNVqub6Z4G1Bo81ZMXP7z5
	SS9/NdHpRrcefUSyAxuVqNY=
X-Google-Smtp-Source: ABdhPJxLH4vbWGbhzIDi+6scroD5JW+X/N7IYGqysdt3iNethklKkoOc5QqSBoXkR0UauwlMoraiAQ==
X-Received: by 2002:a17:906:ff46:: with SMTP id zo6mr20287456ejb.123.1618064454960;
        Sat, 10 Apr 2021 07:20:54 -0700 (PDT)
Received: from agape ([5.171.81.28])
        by smtp.gmail.com with ESMTPSA id l1sm3161950edt.59.2021.04.10.07.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 07:20:54 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/25] staging: rtl8723bs: remove empty code block guarded by DBG_CCX
Date: Sat, 10 Apr 2021 16:20:22 +0200
Message-Id: <b9ff4d7f14decf33064c30b307c3b20494aecbb2.1618064274.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618064274.git.fabioaiuto83@gmail.com>
References: <cover.1618064274.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove code block guarded by DBG_CCX symbol, left empty
after DBG_8192C removal.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 6487aa7bc5e9..dc03a128d439 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2792,8 +2792,6 @@ static void rtl8723b_fill_default_txdesc(
 
 		/*  CCX-TXRPT ack for xmit mgmt frames. */
 		if (pxmitframe->ack_report) {
-			#ifdef DBG_CCX
-			#endif
 			ptxdesc->spe_rpt = 1;
 			ptxdesc->sw_define = (u8)(GET_PRIMARY_ADAPTER(padapter)->xmitpriv.seq_no);
 		}
-- 
2.20.1

