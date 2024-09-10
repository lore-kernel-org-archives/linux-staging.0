Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7C316DEB4
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 04:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725941091; cv=none; b=hrmScUwSq9topM+ZGcaYaZel49WD0KifvhEFwMii1j31MVSHdMr+elaiZ6WCr6CJtMlZNjoDO7OXMhVWOoQTcUfDI9b+ctpQKOLsbZqBp55jWzCvrGSOsrYyksZgAUi3VqMLTKGkZR4p3MBNGOox10DuV9/v5qk7HMJf8Kei+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725941091; c=relaxed/simple;
	bh=yLjbFI/E6WMKbyPscD4uiGdHMIhrp2uBsRwwZrl1ipU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=snRc0Yhn55fzhUxSwETCGXkRqeTUNtPM07So0PKv8Gb2XCs1qZzaW+N2t2bSH3IpQNr5qVvKGDHnXjtRtujZ5Qiz8o01PCRiwOuVWlE/vBDe3eNq1zmgHLqQL5K7haqKVdxUhbots2DRPrqdReMcU6i29gk9cWgqSM6Y+mUGD1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbQNMuwt; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbQNMuwt"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d88a8c66b7so361740a91.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 21:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725941089; x=1726545889; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFv96eIyjX/Rm1g6rrh4ImmOzw08mdxo0Bz0ACVugwk=;
        b=HbQNMuwtjiuTwbfrC38+3lIqR9myfI3m6XS+dMI+lozGLN7eUKFHB3SaBydV9jMZZY
         xGFWN3xIhLUted94SAzN7iIQWyJHNDAuC7hSof/AbQT4mDPgZsiuAWdscCvM6yGnVVdX
         araDMJI3rFIy8Xim2oXD3KNM1JyJUqH0BoHcKL8I4BhohrRhcTM64zmD6KieBWrGqZzh
         G1e4DiN3WcSCwpbjzKiLTAmByCNyBUZ5bW2moZzgL+zpdWkd+vIix4sJ++2D5o4P7eAM
         ZwNn6JIgD1g6ZM//Z+SppNAkPzLqVFFR1hqGuRBP4dLSBU3rbyO4CdH5/sLFBmOyThCi
         0bXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725941089; x=1726545889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFv96eIyjX/Rm1g6rrh4ImmOzw08mdxo0Bz0ACVugwk=;
        b=db+70Sm+9dCw/qVT7QnYC7Lx+yRRYKwpbKBz+VB+R76LiA8dHgVewOQy1pvczZJhJL
         MeLEsWukfKHXGXFC7UEM3GBo2OWwAqO/c0a5IhPMcHNJ5kFfvKl6z5dwmB/y9O0m9yow
         rqiZ/NsIA/pEV5DNOVbEPdCcOrQNsXkbiJ0yDALo2exjaKkxAcgKPdY29KpSqTW4kcU8
         T7svrlRkQDy9FG7oWRdD7rwrKjwXB1rSz4Aw1EMr2rbS3YKtwdTMN7DVQ764BvFko2Q+
         88T9kEG0zbeiE5nLyTjiEQcT11kkzZvCorqV2TpBxifexoWH6HsZXnVZUnXeSvHXsOF4
         VcRA==
X-Forwarded-Encrypted: i=1; AJvYcCURw4vkpSeQxSRtANwfP3/gPLbF6TEQ6D8B+050CeUSktvY5hRjPnWHgMKo+8Vp4G6kK8Ro0hl9bF8ItbPT@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/zp5GVscFn5aWGmGZPAJw3gZ8qdlOKiBP2hE2TjKGVIrrnmyR
	wJyNyqHTlYlQ6qHEIJlR8qrvp9r+7GxnI+EF+i7WP201Uh5g4O9b
X-Google-Smtp-Source: AGHT+IF1+1KlgcjMjgBVIqQ2FMr7ZD1aQaaqg4HWeFp2nehpCNdlivmvWtHrkMxP5WvGnR+yNP0cSg==
X-Received: by 2002:a17:90b:3793:b0:2db:60b:eed with SMTP id 98e67ed59e1d1-2db060b0f11mr4002816a91.8.1725941089060;
        Mon, 09 Sep 2024 21:04:49 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadbffd992sm7456194a91.14.2024.09.09.21.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 21:04:48 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] staging: rtl8723bs: include: Fix spelling mistake in rtw_io.h
Date: Tue, 10 Sep 2024 09:49:41 +0545
Message-Id: <f77f1155d07de7780726562d628e8ed3a3ce4b4f.1725933169.git.topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725933169.git.topofeverest8848@gmail.com>
References: <cover.1725933169.git.topofeverest8848@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes spelling mistake to increase code readability
and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
v3: Created patch series with cover letter as suggested in the feedback 
v2: 
 - Created patch series as suggested in the feedback
 - https://lore.kernel.org/all/20240909041508.2412-1-topofeverest8848@gmail.com/
v1: https://lore.kernel.org/all/20240906141104.10076-1-topofeverest8848@gmail.com/

 drivers/staging/rtl8723bs/include/rtw_io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index be9741a056e5..0ee87be6dc4f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -13,7 +13,7 @@
 	Otherwise, io_handler will free io_req
 */
 
-/* below is for the intf_option bit defition... */
+/* below is for the intf_option bit definition... */
 
 struct intf_priv;
 struct intf_hdl;
-- 
2.34.1

