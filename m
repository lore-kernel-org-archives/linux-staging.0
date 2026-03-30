Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3D03A6F1A
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 17:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774892464; cv=none; b=BWXOogeBB5vVyVnRipGxJz+ba0XN5Vp1n+ax2Ce9OTM6L35I36mwDZ+a+A8Vevc9pjf1ini/07T/o5y53a8sxkjn9mlP6CJDbAqvSwQJ4zlvTLvh5aMItYEpxpsESs7dUN6Yyxnk/vNQxxg2bhw5Yi2a9L6Ojm5gvbtqzVap758=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774892464; c=relaxed/simple;
	bh=88ZM+t1K/1lR4CXqOTdLV+/TyBjxHD/qP13b/YAWW+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cl8Lx7SYD6bPsZ2YDlUMXjAnMjskp+BHJ/0RVzGVzgLGUDZjnBL7v6D+hjIbXzruNeNbHTb+28AA3S4MjSwvdYSDuqWkTiyuP42c1XRBhHAv4qHcTLCwMpAPAuZSsB0E3wipSY20QQc/7XJemSC3QSgWBeXoTD8T1OyrnhUdJiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sE2F1+Pq; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sE2F1+Pq"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-829781b2b01so2439130b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 10:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774892462; x=1775497262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVy602CnFkEAsjnffDl6n+Q2QuDxV7ckhIIG5PyOqtw=;
        b=sE2F1+Pq2v1BPzljrynnSMVNcnrqP7qIBtZSGK14Rz3iNzw7Pc5+p7cgpwnBdTj8rT
         U0P1TxMTFiHgSd5LBQujNd+MK1mk+8AHKMHRNwKzGNURGDPBLWFoQUokPodLEK0CbvuL
         OD9a3wjZLlnJNe1wjJMQhyoSDLwjg4sZW/f1MMPAh6xKEEMS6d3/yZRAf4II0JrdVrwL
         xkCTidyK15sKhgRcx3h1B88rLDbdoFVthlsprKtlyESuMKsM+nQB92CNR33ngOOgH6fg
         AOYFky9P2WkE2I5aRsnvmES31DT5+2FjZcpm27LxIkuj6OhnphK+K6TXD1sCAb5WcoO8
         fyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774892462; x=1775497262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YVy602CnFkEAsjnffDl6n+Q2QuDxV7ckhIIG5PyOqtw=;
        b=r4E+sm68DAH5MvLfBd/8Jye6cv/s/AP4ESDpBWZBC/MQwJ41uFcdo4ptNFuxg89MMw
         g2wlm4r61xpgw2k11G3xGVhQVq8iRSD9Hsp02Tmm+2B2F/4yrX0iAhdqinxTQ+ye3yCL
         yvT9MYhcQUwAha2OuDY0571uh6HdWMWwN+E90g5BikamPyvNWG5KCGvuDgGimgD856gz
         VC1wcEOW2whM0GA8WxqzEi8KJqEvdFFZKDtSY8nOLv6jFov3sGLtG3KyP1G4cUeHWijp
         IdGKiQQWLGIun0KIihC2NeaUWDr6wzSDsXTmeEKrD3vaWziaLlwNEBPHibefoWp8utTm
         zFxg==
X-Forwarded-Encrypted: i=1; AJvYcCWfD1FhvaYrsxXBiOp5Fnzt28/PB0tRxyfmFXKoautXdXgCg1y1eOaLwG1OdhOLn2L8gHMxKaPxNSLwGFjF@lists.linux.dev
X-Gm-Message-State: AOJu0YzJgLG9dq+GsdE0t7PQfLNC+hl6JbWm9SPDR44pIkIbaf+eDnio
	mnKqFSwmN376yEGeUMBTUKXt0CTpdR0zMK1pmaDGbDxjnYctrwHJsDYO
X-Gm-Gg: ATEYQzzeytLestQJNFcNFFXYbGwgpUKrQcK3LgL9Uelk/20C+qybssXWtK2O5KsLSgn
	VtwJvoCefebpPq5npd08c4vS1Kz3YEHpvjV8vvX5lxQ2JiPhhArI5BaKWPgqqM3NGcVh/rupRoU
	2l/71MHZyeubZnABXHFT+/6qam1djP7wG6k/IhMctXHFe4sOrGjNwQHdtZ/DP/5Agz+JwRmqSmL
	zFGLThn2GnsOMScJp2KPa9122D+luoQTLCNd0KA0S+bpjsuILSpyEQ+qUmpoUWoIrPtkfxSnixv
	cP4AT30gYPEF9jrlGXcWBpWeS62iON407ob78nqM+UkVDbLpj8cGUATuO6bn1Mgw/xE58T+Rj7g
	fE9Vjqg0o28qvsGjW6BNu2TRYIt+Bxvrzp/9qlHLs5x7Iskj7QE2HS+tNT08oon93MhI34l0PqR
	2pihEIRzgSoS0ldNnTCDBSQgIFEeq1zI/GYrL82PwA
X-Received: by 2002:a05:6a00:408c:b0:824:3bd9:aac6 with SMTP id d2e1a72fcca58-82c95c234e9mr12931073b3a.16.1774892462084;
        Mon, 30 Mar 2026 10:41:02 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:545e:6508:42eb:3d78:89be:591b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca860b125sm7844052b3a.50.2026.03.30.10.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 10:41:01 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v2 1/4] staging: iio: adc: ad7816: redefine mode constants to start from 0
Date: Mon, 30 Mar 2026 23:40:21 +0600
Message-Id: <20260330174024.20712-2-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330174024.20712-1-mdmahmudulhasan1511@gmail.com>
References: <20260330174024.20712-1-mdmahmudulhasan1511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/staging/iio/adc/ad7816.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 172acf135..5acfceb90 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -22,8 +22,8 @@
 /*
  * AD7816 config masks
  */
-#define AD7816_FULL			0x1
-#define AD7816_PD			0x2
+#define AD7816_FULL			0
+#define AD7816_PD			1
 #define AD7816_CS_MASK			0x7
 #define AD7816_CS_MAX			0x4
 
-- 
2.34.1

