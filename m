Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A279422127A
	for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 17:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753032890; cv=none; b=bBebOa02UZRCHhuG0Ajxid9VpHjekHzdRgoMnRmDrltB+N+TPyhBrk22zm1OXCiouF3ekONOgCoxDDwxlV4XSD3yuBbnMq6o0PXVoXWVggYdWJ3TFtnZ1VfQIGDQyYQx0LFR1c3HxTwBfAx0DJ29VcM57ivnAvX4w3uyKjLDGJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753032890; c=relaxed/simple;
	bh=WYiPAll4tY1OAECznw8fHRxRO2Vrsqio68NfasHC/Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SLuCusVxiRLTOpv8TXOoZ71LEYI9HijL2MuVcdr70xPVNv1mGTXES8sxyitni4CR+VBsL/RyZgj8pmxxycW8wuoO9qOO4CCHgzHDVtsnc64GcUnvyAZcgFRr013jG7upie9XNsj6CS4ygdVv+uqbpuotjndVCcc5gD8KooEjIh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRl7gtP3; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRl7gtP3"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae708b0e83eso641582866b.2
        for <linux-staging@lists.linux.dev>; Sun, 20 Jul 2025 10:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753032887; x=1753637687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0rjwniYbLc2oomqWt/74DXQQMaXpZxhV3eVwursaB4g=;
        b=QRl7gtP3p5qKIHg6e2g49HN8iob6PHhEPnis/KTqYaxGnUXjJUVxEqWSv35lT/UBAJ
         O2uXWIcuQMWeLJP7QTxcx7kFzdUomtzXzc1tpin+9wEjpBtbcfJXMcpTLq0hYuUen7v0
         V56kraEBJB20841nXtTo7MilQ9HY963ktRoHX9DQ/en0AS/QST5i9UAu7i2N4JL9rnkX
         hZ97LEevT1hFlj1J5O+R2TC+wyxP8N/2yxvaqNQjm9euHgHO8HPXj0lkoFYR3dJ3ZJch
         0TiG/g30+eElWZJCpKvwfevv4IidsoC91p38eHG5XEwVOKKGG09emKq7ZHrbuOX7p8F4
         e+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753032887; x=1753637687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rjwniYbLc2oomqWt/74DXQQMaXpZxhV3eVwursaB4g=;
        b=T9lz3eXoS54M/A0ACLjIfsMvb5gtE2I5nefK60VSJa/UglWxwnfoqjQR1nT9J/TPWv
         h7ZJhVIMfh6N5B5/zaxPxHyiN5ouCmEkZCFUy1G62BcENiueeSSvOD2nv5K2QxAjCTFZ
         h1+nqvEKqkzuqt3zCr7eDOBiNZtkD9dhf3yHTVq0QIlFtWa5s4ljHJ20hJIbTrxVlVoT
         WsAUo4P+mBA13Ex1rJwC7oHAh5nBKMTkCCYoA/sO53+00j8r57TfTSmzxRZ46n2L90yO
         yNZxL5r9U1dBeNPbWTb+aL19OSYtA2y0OO1v8IuPmtnwa7EdLxLBefK3gDe9qL3rY+5G
         NBvg==
X-Gm-Message-State: AOJu0Yx0yElQPGSZC1AKLhD6gpT8DRPZmkhUxo7q7mILtlVMvfEeMKh7
	Njpf3PZ1a/Z+xle96wdd9JZWopc+CrC9tZgwB+KIASyGOQcdWJhDPSdQ
X-Gm-Gg: ASbGncuZSLO+WQKsZAB/6l2av9nmQHoj3j2n7G09l+lFffuMrYoQ7B+wZMwAoSy9dJY
	7t+6RIgDx2sVM9xCz8pbZHkcOcN2hh3J+fK5vVNqGkWZrIaParevZt1H8XrF0ZAO9t7hn70ybK3
	mE/CWw0sOUdZCOlSX6C9w3ZNvOmXY6as8IiUse/B4Z0GqxMHptLIZrOsCAKOCrccVXFfwBygsCr
	hd6+mO0zfFtUPxzoa6zcCS8VygQ/nqcQ/ztEuhqTTA2Zx62AZZKp0UZnrMluO6wD1Yl7szXivsc
	tZY8MnJLf40MIvVTTgGjEp5wnPuWDavJDuJpS73guqYsB37iNSItjTB110souf7pBSr4RsWdgFN
	7Qxvn+ErgJ2gFgDU1E1D1T+aQ1JMfzOkLHXcF7Y7xsLtFW245FgUogJwuK7U7trvQkhW7/qg=
X-Google-Smtp-Source: AGHT+IGXQK6jIhKKcIF11I3HgYglI/oR1jVmP6EakhyNay5Tui2wXSyGLl+RONdwe1CszFyNGexblw==
X-Received: by 2002:a17:907:7f18:b0:ae8:fd2d:44b8 with SMTP id a640c23a62f3a-ae9ce0778b7mr1737021366b.29.1753032886716;
        Sun, 20 Jul 2025 10:34:46 -0700 (PDT)
Received: from PC01.localdomain (094190205166.static.ipv4.heldenvannu.net. [94.190.205.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d475fsm526842866b.43.2025.07.20.10.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 10:34:46 -0700 (PDT)
From: Bruce Qin <bqn9090@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruce Qin <bqn9090@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix if-statement alignment and line continuation in rtw_ap.c
Date: Sun, 20 Jul 2025 19:34:44 +0200
Message-ID: <20250720173444.33407-1-bqn9090@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses three checkpatch-reported style issues in a multiline
if-statement:

- Moved '&&' to the end of the previous line to follow logical continuation style
- Fixed indentation to align with the opening parenthesis of the expression
- Avoided ending a line with an open parenthesis '('

These changes improve readability and conform to Linux kernel coding conventions.
No functional changes.

Signed-off-by: Bruce Qin <bqn9090@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 383a6f7c06f4..838d2feed883 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -258,10 +258,9 @@ void expire_timeout_chk(struct adapter *padapter)
 		} else {
 			/* TODO: Aging mechanism to digest frames in sleep_q to */
 			/* avoid running out of xmitframe */
-			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt)
-				&& padapter->xmitpriv.free_xmitframe_cnt < ((
-					NR_XMITFRAME / pstapriv->asoc_list_cnt
-				) / 2)
+			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
+			    padapter->xmitpriv.free_xmitframe_cnt <
+					((NR_XMITFRAME / pstapriv->asoc_list_cnt) / 2)
 			)
 				wakeup_sta_to_xmit(padapter, psta);
 		}
-- 
2.43.0

