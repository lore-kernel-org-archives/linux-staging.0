Received: from www.redadmin.org (ag129037.ppp.asahi-net.or.jp [157.107.129.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B901226B2DB
	for <linux-staging@lists.linux.dev>; Thu, 18 Sep 2025 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=157.107.129.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196598; cv=pass; b=lvp8U6Shgj5gcSGD2uQ/ky4mW92v7wUDSEzdBWeg/wx2Ht9rMdQpPEWjLGm/wlIcQ66aqNpyFqrY5Id73+WpycEMqiCtRFzs/po6J+9PMuJcxUH5o5DYVDKC6D+jTkd2CVNawStoHNpcoghDMypI++TkGD2cNjkpBsVx6LiKvgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196598; c=relaxed/simple;
	bh=kg3XCXyfzhc13IbD0TYL8vZvFqv7GPplWQmajnMl670=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PfNGIZYoBnEB4DxS0gkABKb09IQiGMgjR6fFtsi6eZJ+/HZarglwlG95tlT4JLUSzb1zjadjKxtISHV6nVQCoCs5JwHfuZK3Lfmow5PfXlUusiMqkg+YKljCvOm6s/pf0QkgrAiuSHmUjo84AFqsN3/GrpPS+0toDnrmi6uCtdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=QZ5gpNZs; arc=pass smtp.client-ip=157.107.129.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="QZ5gpNZs"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id E8C0510A25223;
	Thu, 18 Sep 2025 20:56:26 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2MY4fi8Sklhc; Thu, 18 Sep 2025 20:56:22 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id AE99C10A2521F; Thu, 18 Sep 2025 20:56:22 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1758196582;
	cv=none; b=ehhqe+hjFhqsaMTS8tz5pXL5wO9Bwsq/fzdnEMk6JCHyYUYLbdjsJoRI9OdFGndNjQf2x6HSRBmfFmXqMWJ22hr7MEsaiTbT5brvVMtr4ykzj+g8FJTAK5LDo6BnSsJE0kJ3tG6YVfs7rRqRMD9YJWet+UGOLiGCDbxi61ZzGJY=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1758196582; c=relaxed/relaxed;
	bh=z4mj2+FYZp/bjZ1cbGcCbQXVFR3CSFUwvkhaQ3JRy9E=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=CWcmOQJGTrjgULdhGI5zjlu34r3T8cCsB6bKs4nrj3kSTDModNsr5RTxM9r5Svi0maj9LyL2Eszy182Too8GtkG30gIJiPPchSxp9+7VBUxES6RIOIA4w4y3uGrS8imfc/ANQh8RCOHHF09iW0QdmX7mkV35WzFBpd9KaJ4GVDQ=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org AE99C10A2521F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1758196582;
	bh=z4mj2+FYZp/bjZ1cbGcCbQXVFR3CSFUwvkhaQ3JRy9E=;
	h=From:To:Cc:Subject:Date:From;
	b=QZ5gpNZsa0DU8wjs4DJxQ1n0+YgxExItu1P93HXdqEVf8msXK9Mra733Mv3kkwyIC
	 OgYjS4sHYdPugA8w4+gUucEnpbvIsn6bvNIshPVHZ2lWedVr9lRLuamMYr4tT+kgET
	 A4Fq54E6XvlREAzztnq4dFxrmgHyv6bcLeUSYpso=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] staging: vc04_services: mmal: fix typo in comment
Date: Thu, 18 Sep 2025 20:56:19 +0900
Message-ID: <20250918115619.1616818-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Correct a misspelling in a comment ("recived" -> "received").

No functional change.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h b/drivers/=
staging/vc04_services/vchiq-mmal/mmal-msg.h
index 471413248a14..1889494425eb 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
@@ -13,7 +13,7 @@
=20
 /*
  * all the data structures which serialise the MMAL protocol. note
- * these are directly mapped onto the recived message data.
+ * these are directly mapped onto the received message data.
  *
  * BEWARE: They seem to *assume* pointers are u32 and that there is no
  * structure padding!
--=20
2.47.3

