Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A01114D6ED
	for <linux-staging@lists.linux.dev>; Thu, 25 Apr 2024 16:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714064371; cv=none; b=tgd5JpUUhyk7qcYN8Iz2/pce6YIoxPLIPO0iPOKyZ5+MDHNqn2OZ2vsH22vExCnydTB+b0jfUZ/cS822SzNmDxA5cRYXMq4y969Z73EXHvCdCZEJK+ONGd15OP1XOkR8MvsMB0I1DMrOqpp1xO4FhL5oSt08+PgVHtOF5uEZnrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714064371; c=relaxed/simple;
	bh=gVmbL7xjcpocw3NCsu3h0BYYG6oHTVg5iZZdZYCyXHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Guq1/W27sR/XctaOrXtsBHLCiMoBIWcH9JPfMgN52XQqie1Z7BBXi1o6ry+jwxlULwzNZm2Lhu4wU0fmzUogsvvqzTGTTIIjIG7LpPG3h9R4l2HBndBvxzijCEzm8gCpoT42dHuuCO37XTd33xP+Cf+mkjc1wLIo0AANRv/KAuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Nhhu7SWf; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Nhhu7SWf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714064355; x=1714669155; i=wahrenst@gmx.net;
	bh=wPypIIQTokbo4EjM6YVsR7tSk2WsbqJ0JopVFbdtfEc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Nhhu7SWfZQBYDq7s9vyY1wVX5ZeCH+aCghLvy2Gzfz4O2hjCGylkiU5WwtY7cSgN
	 vQJxFN4GC32J9DbtVelL1UYZrA4Mp7kjnw/WzdaJzw/CQri0wbxRZLWlMm0okC0Pz
	 y/QpBkHDI5x2dESiF4kxpGZvTf7v9WyOcU1mqEHukxUSpGHKnBWIW00JMH+KJL9Pe
	 sgEn7skQW+0xuIlx8f/FV4alCV8h51wRwDNB1LB+eygN43o1p8NEP8F00Bh2zfptd
	 6p6rXfCYvYRr20WLLbDsl3c1HoaatVBpSzHoZGwe53ewnyJWb57hAIZKgC13Sf1Du
	 Qfxh1vzmD275rGbeBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mr9Bk-1sVImb0p3m-00mnX6; Thu, 25
 Apr 2024 18:59:15 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 3/5] staging: vchiq_core: Add parentheses to VCHIQ_MSG_SRCPORT
Date: Thu, 25 Apr 2024 18:58:50 +0200
Message-Id: <20240425165852.6681-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425165852.6681-1-wahrenst@gmx.net>
References: <20240425165852.6681-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oY5UNS83PsUXx5/TDMB16nrcmlHYSAjojirgi4e3inJkU1bQEAg
 5nqS80rj7SvicOQQlNv1kF8LnDtsd3/R3Nw3K6KC+iAy+nMJtlQfBzK4tfTGq61uTAeJgP3
 sgXz+4zIU5T7dMO6tL49z3KS1Yf5oRZ5xFb3weG19XlFgtIiTenDEl0DlIwvGa4Sc6p9Mba
 FohIoHB0DPbs8EvqIQlww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kjHtP95uzF0=;Wv2JQC4KtR6rfUa5iTBJk4ofXt+
 WkwAEecJK+VhEPR6oOFXAh7tBegI1aPG66zxehOkc+yJvmvd8SDHSSgtnMn9Vwig8v8Iu/BRN
 tpERlKNOKQIsJTGOP6OqJA7S3TzrlCp9SkRxnyfnszJWmmlBovcqCebOS3RyeMq9cjrFC5cXA
 f55QOphoB4ykXVPUM8GD4mq/pX+7A+qpKVnP0xPD5QDq1Yag6msWgeA7a6jw5uQVBIoZUPah6
 9g36XvgYx0uhGYboHzLEAFfSJj5rmqgu1ND/Am9GCp9pobhMSwt36zuEMqgQZi9nX9deuA66d
 GuSdG6CHSbEZaad0dNO9T1iW927KfFCtDHxuEnBDkE7SZsfzC+0Qwt+AgO76ISI8AnitLLSj7
 QeCYfWEUPeWyVDKmtDOGPZ8Yd2c5zW9Z97DVFTKGK8LZJ41cAVT/Lawdt+sn/CbSBAaBvngpE
 CyWsh086Esrtylhfa/fv8oyRul947OYHhQQBs/fP0499+T3Nzg3fgyX9sW76CGgnzEt9hyZd3
 OcwP4imab+Abi2IJtw4bspr6KcaRMJc0WEDtnHtjYvZe/CDcYGhL+Y6ZK5qAwBOzk1a2FZycj
 7Mf6bTBEotXuoMKlcW+csl1cljmINEoL3mguFZMD1ZjPFUItWWo/G7NsQUxJSeDyMhgmiGC6/
 9hWiVtWtrLASzoxm841M0MIot0cqDmsoEuhd9A6TJgD0NW/fZpZRmHFhOcmlei72jdEtviTNM
 fGMpA8JZDwQRucCNLxTgACPvcvB74xJcuQmzQo7af7DZmz6jBzd/d8dyN7N++dc4u8czgBq0z
 mFd09K0GlUWDq6EebO2VGI+f+YmsmJe7IBbum5mmuJor8=

checkpatch.pl complains

ERROR: Macros with complex values should be enclosed in parentheses
+#define VCHIQ_MSG_SRCPORT(msgid) \
+	(unsigned short)(((unsigned int)(msgid) >> 12) & 0xfff)

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>
=2D--
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 129d73fec2bf..58451ee08abc 100644
=2D-- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -43,7 +43,7 @@
 	(((type) << TYPE_SHIFT) | ((srcport) << 12) | ((dstport) << 0))
 #define VCHIQ_MSG_TYPE(msgid)          ((unsigned int)(msgid) >> TYPE_SHI=
FT)
 #define VCHIQ_MSG_SRCPORT(msgid) \
-	(unsigned short)(((unsigned int)(msgid) >> 12) & 0xfff)
+	((unsigned short)(((unsigned int)(msgid) >> 12) & 0xfff))
 #define VCHIQ_MSG_DSTPORT(msgid) \
 	((unsigned short)(msgid) & 0xfff)

=2D-
2.34.1

