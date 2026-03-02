Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32313909B4
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 21:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772488343; cv=none; b=DOozrxBRDm9hwxKsh99bNXOKjpMoSdD2Bg/nFPwNP/4DyiHdoJzTgfxQv3klVj92Pls9tF745IEPZG+s73NaSRnVG72RNkkyb0N+jUHXEn4/8n/qnClF7BTsC6poo9ZKOot5FaP/fBEadjQgVKWoG5jEXiQc1q+pRxlEQCnO9wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772488343; c=relaxed/simple;
	bh=mUXEkU778Bt04ritHOvwq0JOkIzGfND/q9oRghqWay8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gdVNISkd2R1BJv4ukv+Ijf8wyDkeNz9guwZjGGMmJeY0xK3hyNsqpARrXTem2BWJbAD6oD6oGzBs/8peyOz6Y7Buz8JxQfRylyCbTLVmtPporJ6JMpXXEj7juncLUuJ3UOwsD6n6S/IPrZAMzSGFjuhKpdvO8FvzFKU17QhMyBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFDsMKJV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFDsMKJV"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so874123f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 13:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772488340; x=1773093140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9lI9DwK/kH5iem+/RjKxFsMe4yNTC2uCGSEH3DYH/NM=;
        b=UFDsMKJVMQzUBZaiF9bOMabPfCEREdpzT3SGDqgX4HJKnRf25+PrfgciZ9fuctKTeW
         P8Sg4+LqhXhr7he+SD/tnCwTrhZbpjS+kllGoWqt0HtBmwPMZy10xbybcXD1WzpSLpD6
         jsIdzdx/Lyy7T2amWYSK+LocnEtMpJpc6txlPbFqdqIHjohjXNtS2GxnzLxuR2bLZkOO
         QLiUP7hbzRRd97oMEwyKrX9l8ufwRftd1tQRb2fy2LdX5P1b3R+wqVPlRQ5bF9ez73fa
         L+oyIhWImwJ1NISKk+lU6KhF6kVjWxxMZ3NN/C6jdJlC34AobNmwJXAV6e/41bzuTeda
         WS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772488340; x=1773093140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lI9DwK/kH5iem+/RjKxFsMe4yNTC2uCGSEH3DYH/NM=;
        b=fHYvxP2PP+5BnU+9Mi8e3ftCJziLIKOsL6jXejBdmBKtNcY1BArp5Ptrzg8T9LcJVj
         PwnjCV6PTSRnwaAuQcLqm0biPf2S2y6cwjYNHgpvRG00Gw8J2vGoN34VT3M1+XXQ/iPQ
         F56CSB6hvOCShKIHHu+QFFQnbKWKCZm0cNGmaYPk6tKkQNk4DEnaDHFwZxSMsuopJmiC
         rWpVLZOC2RPqz5UuMYqwugFVd65SeiqWQVPaOPoTTwcnplKbwgRxvLhnVve4RrNDiNC2
         Ck8PcNdmQTKm6ViJUT4mPKlM/Fy7g6R0KyjLoQdU/WCQ2O73XY3SdiQdMqe82o8+MnuL
         I5xA==
X-Gm-Message-State: AOJu0YzNFQidmWHomuyEJY3oDNHiUVy0G9aytMjRayni1mUgGMPxcGLK
	cb1iAw7Fns37fDlI70XM0AchYQs8qn9qIHH41IWEcSzeU4wqUfUx2w4N
X-Gm-Gg: ATEYQzyVwLZQ3OypmNyN/K11UQCHWEVf/6g9KvPlfkWOM/EFpqvLG9HpaPlVHPk9j43
	WeJnlAUHdMsxvBlgHBFB4nRuuje+lwV7h0Uz3a6So3dPMHcVDLIQRVaD5qBPE54XIOIbofjWMgy
	bZclQUs4vmjMLgWTDyEKD/nT/tW5nfk1NYCWxS/yBFZ2AfgwcrAzBqh67P3+ZmmmYBfmp+u9Xn5
	bSZzxkJU/F7tz9/iOjXuv20KZmaPj7UF7sfX+FVh3IjmmzgzpRIf8BYWmkBe7cZjAr5J6JT3wxX
	vGV/UenpbDCpuccHQZ9a5ALckpVVTx+jE6/yn2reQ1cS6YiYqBaJx0Unl5dLvurxSpRTApXGqM/
	TMRDzJV6GelwyaDF+M9ktnbfOCjOpVdl3Yf5AF+HZMph83Cl/Hx8zthbgFaIsytpZws4zAU65lx
	FOpNLdZpps6unrU9lFaL6CEryeBZDqmn/rNdOm+cewcEap98RMag==
X-Received: by 2002:a05:6000:2002:b0:439:b0ed:2afe with SMTP id ffacd0b85a97d-439b0ed2c3cmr13079743f8f.11.1772488340124;
        Mon, 02 Mar 2026 13:52:20 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b34b6252sm14150602f8f.10.2026.03.02.13.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 13:52:19 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	Siwanan Bungtong <horstaufmental@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix bitwise OR operator spacing
Date: Mon,  2 Mar 2026 22:51:54 +0100
Message-ID: <20260302215208.67045-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spaces between bitwise OR operations rtw_action_frame_parse() for
better readability.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
v2:
	- Remove curly braces for single-line statement
	- Move `!=` operator to the end of the first line

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index dbd4bcc8cd28..9c1ee1411c9b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1123,11 +1123,9 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act

 	fc = le16_to_cpu(((struct ieee80211_hdr_3addr *)frame)->frame_control);

-	if ((fc & (IEEE80211_FCTL_FTYPE|IEEE80211_FCTL_STYPE))
-		!= (IEEE80211_FTYPE_MGMT|IEEE80211_STYPE_ACTION)
-	) {
+	if ((fc & (IEEE80211_FCTL_FTYPE | IEEE80211_FCTL_STYPE)) !=
+	    (IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION))
 		return false;
-	}

 	c = frame_body[0];

--
2.53.0

