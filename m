Received: from www.redadmin.org (ag129037.ppp.asahi-net.or.jp [157.107.129.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1022F90DB
	for <linux-staging@lists.linux.dev>; Tue,  9 Sep 2025 05:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=157.107.129.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757396029; cv=pass; b=OFBhnwjMQ1yg73kbIvE/u7Cs0LNP2jYd0e+Z0QuCyAHOaoJXPaD7v8LrnHic0d0WgN/cl9Rt43xzXhxwnVyJcKq9suXYt5N4iOtz2ACoWOfMU+MheEL2tqQYlrOddd9Iq0rNcerw5sIpIbxbctAi18wlLKbly48JKeNO2c+wJhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757396029; c=relaxed/simple;
	bh=Jiu9IkpCu/PhD8blolrlBLuSV/bRiQPpG3U0Bpj0fIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVWZfeIF/T27hL6ajGEziUMfkX5hdM4+S5x2pwc6em+vGgJap7IEAmldWWnO5xpxBGNWi5gb7SYhNxWICh/+jr4hqBzydFETfOkU1yRp4kfu/8vKsx+9wG47Rhlx4Rwzt/05tnUAeFeGXxKYJC+EzLU97mmEaVBeIPm9bRTszpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=xgccHTth; arc=pass smtp.client-ip=157.107.129.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="xgccHTth"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 1BA0E10A2494E;
	Tue,  9 Sep 2025 14:33:46 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zI28cWgu0xBq; Tue,  9 Sep 2025 14:33:42 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id CBAFD10A2494C; Tue,  9 Sep 2025 14:33:42 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1757396022;
	cv=none; b=CDBKTDcc8Lb8se7VrpURCzw/GlwNfQayML1fysTNxscyxsC5b58Pec/Z00ejLSYRgDRZJf/SkBqsDOE9t3F0+BRqmB9rb4tEjGfH1zZDgd5WdIxcfjhnAA1ctqcSt9TWD/1UU4vhafPM22LIoNwRmuy5xWskIb7I2EOQbhYIxU4=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1757396022; c=relaxed/relaxed;
	bh=8A2BTSpE6bRBxzMuwWo4ycK919iclxMMLpgmuPjlQRg=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding; b=ZY0seLZ4Iz6vrlHhnDxFRn7nPMEg6Ks0Y6HR86lImypuoiKe3zakkdfULtibANldc1cMo+cbP5iBJGtD4cK7htrFxf/mywrZHoW966Zm1KCme5aFv/TVuAg+jEQ7MEvfkh9a9trQZ9ioEdnSi8ojnKf06i8o4em98YdtmMg2dwM=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org CBAFD10A2494C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1757396022;
	bh=8A2BTSpE6bRBxzMuwWo4ycK919iclxMMLpgmuPjlQRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xgccHTthhODA6cE2MA88DeLpFEEF0V90fy6pJSX8sKkGtvXCi9cw7stUndkrsJ3kQ
	 qgyvnZizcZx9kZO62wxZ0t9UiRLei0eAZ1KAR262UAzHFJImFrAFfpaNZLFDp+YzmK
	 SfzHdxh7y1hU6ZeC8XnUesp5SDFIaWWyet+0t6eM=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: gregkh@linuxfoundation.org,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH v2 2/2] staging: rtl8723bs: rtw_efuse.h: fix double space in PwrState parameter
Date: Tue,  9 Sep 2025 14:33:27 +0900
Message-ID: <20250909053327.140763-2-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250909053327.140763-1-weibu@redadmin.org>
References: <20250909035804.129904-1-weibu@redadmin.org>
 <20250909053327.140763-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix coding style by removing a double space before the PwrState parameter.
No functional changes.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/stagin=
g/rtl8723bs/include/rtw_efuse.h
index ac7d6ef454c3..d791e35db769 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -92,7 +92,7 @@ void EFUSE_GetEfuseDefinition(struct adapter *padapter, u=
8 efuseType, u8 type, v
 u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data, bool	 b=
PseudoTest);
 u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool	 b=
PseudoTest);
=20
-void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8  PwrState);
+void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8 PwrState);
=20
 u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
 void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType, bool bP=
seudoTest);
--=20
2.47.3

