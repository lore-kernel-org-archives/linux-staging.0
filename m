Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5B41EB1A4
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952108; cv=none; b=bzfvmfofGqtPyThcXEKWkO8gjhoWWvgSJnW5U+hBkGRzykHKUj3wdvWphLWjw0TDTK23jOuDZNvPr7Cbl7OWhnGQq67PttqmVJyzmNNWGDoj1tt97qYSpz9vOcs9jCr8HFfFITxrM2RYfnbz44FJg599Vd5+IZr7uPbEUCgsDhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952108; c=relaxed/simple;
	bh=dr1NHuHnEvzKxM4NCMXIbI6L7kEzlrhuduejp3z9nr4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TLDIyizfMIW+b9JVzMu1wNY3Zoxjpsv9IBGPyjAWBucq0lFvjDPMbYkSM3i1QxIZ8Tm1Zb5t2KaFD0ow7crwwlsnIAlQhb+aqjkl3UJIsx5fmqVvzO0ZpcNQbs9d//yT1YeNr0md6vNQQqnFN4osteV5Z7x/0zq2wDIBHmlnshQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjPr+4l8; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjPr+4l8"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b32ce93e30so4960381cf.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952105; x=1757556905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjLPKVYL2fqcNwsEtvoyIStMoXdYJapAZuhAuAsk5ek=;
        b=YjPr+4l8BI/Tqsd1w8p0aM4+Rq0SXsVdoT5YU5ni70ZgcWm7MB/2ciWZf2Vr65lDvq
         ltQCgp5csqtYehWOs4d5zOyWd3e7x3eqSL7eAsIZfY2sECPFsebFEIZ1iCipKKWWcQ7w
         cYhNoBBY+LjWERM+g3P5p9Kc77jIPAXjo4VRzIEYf9y9t9cag2ceUAwWPZTKTwmHBgmG
         48DgIZA4w8RdGIL75xYOg8/34dG3TaHpaoIcpa40nJzsPeiBZTA1Bhr2EPO/f3yZse3S
         Q1L3niVx0ZL+6NvIeLvKrRGei0U+g474IpO4zVzemCXdhBw0OfdHPegIMDEBsA47e5Di
         W+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952105; x=1757556905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjLPKVYL2fqcNwsEtvoyIStMoXdYJapAZuhAuAsk5ek=;
        b=Ddb4h1N1cj2Y4nDOrdtibn034DYUCx1RAeQQ0nfXQECOoz5Ff/JYVG3XpdUHJCN1c1
         tW/xdyjgg0iZdiadqNP7OVgHQb1SbtgwItiUN3ehrXt8cVW7hQZEa9d6tFxxDoG1AYoi
         6Xnh+sGnGmuhFF696V5sScn0zRJkCjNTYIPkwkEUWZKtL58gmhMd1isgDhdYb6W70qew
         wmB2Ot9kRSw8cBwpe+JBEdgtYRdJknnpRnXCmX+HR6on5ymw0sgw4v/45//j99Z5zZ5M
         Qa/jlZ9/27dGB+n5ZqVlzLa+wh/TWpjlloZ2AI2S6hbUm3Jxn76bdEgKUyzL1vi82HQO
         b4SA==
X-Gm-Message-State: AOJu0YzQcw3lp1z9U+PVfyw4M3VdKPAWq+LtmvpAFK49Clp8gVvV90DJ
	tYz0YIrponRWilSH8WpvysvtWQTOaAwAW7jy/DVPZB05eNNGOfbWu3xGt5LwWA==
X-Gm-Gg: ASbGncsCjhPXbzmqq8xhTO+Bs4T/6poVnNIWZ1HjuS2eMtES1TOYtiQEXAjf6Mh4InC
	GAlNTtBBAzzlSABDlxZwBjC6JRlTlYqMlI5Cilp8uDv0QPyRTS2Qr9+YIbQP8HrIaN89mT6Nvk4
	+Md7qyt4zBYtQnybQFxp+rpM7C4gTXCRfkLJipc5H+PycV60i6SHhzSlyRwtWbShDXM58QHlCNs
	K0I6E7AlRAlIDxsSSaebayBcek0riw/aBES58MhUV4X2v+VU2HdWCreFjtyQeGYhrZW82K3ZHhl
	fPgUzbU5U6gg3MrBpJmgBCud7Hfzadsvxa8ZitXC4hBdovPWcPKXU3tsLhjR6tuKweCGN2hTFQc
	pt7s2+e9dMyGmZ2eo9lk1eLdMo8e73mvdPcUl/IqXsJOMQt5ovY1JEDNXubUy0Q==
X-Google-Smtp-Source: AGHT+IHHZwqjGBH+gVrv1uqdsL5o0HYi0fqBPQZogImnszYScoLfA/gc+M4UxD3AhjbaRC/XGpVSbA==
X-Received: by 2002:a05:622a:124a:b0:4b3:ea6:e0ef with SMTP id d75a77b69052e-4b31d845107mr219283871cf.12.1756952105135;
        Wed, 03 Sep 2025 19:15:05 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:04 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 00/16] rtl8723bs: cleanup and style improvements for better readability
Date: Thu,  4 Sep 2025 02:14:32 +0000
Message-Id: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series includes 16 commits that clean up and improve
the style and formatting of the rtl8723bs driver in the staging tree.
The changes address spacing issues, indentation, comment formatting,
blank lines, and minor code clarity improvements.

No functional changes are introduced. All commits adhere to the Linux kernel
coding style guidelines to enhance code readability and maintainability.

The patches have been tested and are ready for review.

Changes in v2:
- Resent series as one properly threaded batch
- No content changes

Vivek BalachandharTN (16):
  staging: rtl8723bs: fix spacing around operators
  staging: rtl8723bs: remove unnecessary space after type cast
  staging: rtl8723bs: fix overlong lines to conform with kernel coding
    style
  staging: rtl8723bs: align asterisk in block comment to fix formatting
  staging: rtl8723bs: fix logical continuation style by moving to
    previous line
  staging: rtl8723bs: fix indentation to align with open parenthesis
  staging: rtl8723bs: adding asterisks in multi-line block comments
  staging: rtl8723bs: remove space before semicolon
  staging: rtl8723bs: fix excessive indentation in nested if statement
  staging: rtl8723bs: fix unbalanced braces around conditional blocks
  staging: rtl8723bs: remove unnecessary parentheses in conditional
  staging: rtl8723bs: remove unnecessary braces for single statement
    blocks
  staging: rtl8723bs: add braces to all arms of conditional statement
  staging: rtl8723bs: fix line ending with '('
  staging: rtl8723bs: place constant on right side of comparison
  staging: rtl8723bs: merge nested if conditions for clarity and tab
    problems

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 421 +++++++++++++---------
 1 file changed, 252 insertions(+), 169 deletions(-)


base-commit: 5141ae32d4b8971d7b689854fd47a200e695bda3
-- 
2.39.5

