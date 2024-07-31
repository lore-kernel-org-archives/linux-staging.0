Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A469E171AF
	for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 16:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722442149; cv=none; b=bNu7TJBa0BNRBpaZN3fxw1nOymIsHNC2o8XgB2zf3OEnXcANifaSQPwLhEqtWv9lQ3DtHgbWHxnMo0t2VcXWYC16IAs+EUfDXZYW7D4K3Pc78/kHFVs4ZS7fcqjrj8CQVqKdbo8Wi8kztVlypK6iptcIAbI6y6z60s2SMliUkw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722442149; c=relaxed/simple;
	bh=K6dbgpXwLZIztDeHX29B4LgMK9GUn/muyr5rZ8zcBtQ=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=BIcvDJluPZUOFMMttW8V47zNRdbn1ndc9PR6FLwx1dYlDc5MFM0oAbqK6oTBPb8kBfyUVxcDWl8kOFJoByHL5BzpR4+ijTTi92nSPliTB+c3VbRcSFR9XnWajMay40nQsCXud/KK0M2m2wXKi0m66lcLbmRHZgQ32CFTfNPmvew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eipi.fun; spf=pass smtp.mailfrom=eipi.fun; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eipi.fun
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eipi.fun
X-QQ-mid: bizesmtp87t1722442132t327ed28
X-QQ-Originating-IP: jwUbDvYvGU1K4Kwur+CFHh6H+fgrSe4ZGyojye9zlVs=
Received: from [192.168.0.9] ( [118.38.173.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 01 Aug 2024 00:08:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4618790565118997799
Message-ID: <D20EAB24BCB3973E+206e698e153d5379aa8183d9446ab545e758382c.camel@eipi.fun>
Subject: [PATCH] code indent,
 drivers/staging/rtl8723bs/include/rtw_security.h
From: EiPiFun <me@eipi.fun>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging <linux-staging@lists.linux.dev>, linux-kernel
	 <linux-kernel@vger.kernel.org>
Date: Thu, 01 Aug 2024 01:08:49 +0900
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:eipi.fun:qybglogicsvrgz:qybglogicsvrgz5a-1

From 816921cbfa76a1cfd0cb1ca93a9df0f2a429bc3a Mon Sep 17 00:00:00 2001
From: EiPi Fun <me@eipi.fun>
Date: Tue, 30 Jul 2024 07:28:38 +0000
Subject: [PATCH] code indent should use tabs where possible

---
=C2=A0drivers/staging/rtl8723bs/include/rtw_security.h | 4 ++--
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h
b/drivers/staging/rtl8723bs/include/rtw_security.h
index c3e47d526..89c1d5ae1 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -75,8 +75,8 @@ struct {
=C2=A0};
=C2=A0
=C2=A0union Keytype {
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8=C2=A0=C2=A0 skey[16];
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32=C2=A0=C2=A0=C2=A0 lkey[4];
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8=C2=A0=C2=A0 skey[16];
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u32=C2=A0=C2=A0=C2=A0 lkey[4];
=C2=A0};
=C2=A0
=C2=A0

