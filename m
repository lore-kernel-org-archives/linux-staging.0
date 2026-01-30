Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142352D063E
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769778550; cv=none; b=qrOdUtc4Zz8RYFTN/aGhPp4PGAqxqLkZS8l/0gCV/wTVSzSOdiFt7sC8JEPfdRm+4LCZ16wY+PzrrO61Bcc4tksV0TPrUR4dsiYubTm7kJszyiOBHkRT+/TEINgtItMbFqrFixrwFRLsuVBrkQJEs2JCu7B1oXJCQ1ju9niGpXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769778550; c=relaxed/simple;
	bh=v3Bpoh7mzKxerAWjwTnIT2e3lr4+w1MFSfBmvdiOMpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SJ+LAOZlzh4FAxpmTotcRHaJHHhBa9rThySMb02UaPZmVziHnxYqgTrTOq7DqKZ4J3lOEqYNQMvbUbx1SkXsHPrl2M4QlgUxrqiA8AcGumQvTvjeSp5NF6cpO55ucC6Vrh2kVS9vq1cl7/P0HH+UL9oYDB9/jUqsBnG2LeAWhnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Lp53vOKi; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Lp53vOKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=yD
	8Mc62NWOxmn37SRRmFD1jYTZwQuFwRflIBAGIPgMc=; b=Lp53vOKiMelekALfQ3
	tyDkDNXaUockawaKg3UuRYxfVB3ssifwSHJEZgWncj7bTvsQd5HOcQqKxQhAxub5
	cEBX5yfeexDiX9XegTq8XEP+Tl+T/FbCKnA7mGl9EbrbV/Fy+9s4mCDMS5GdrDt4
	xylVDdPf23CgqjQC/kYZZRCSA=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDXfyE3rXxpDd4JJA--.6621S3;
	Fri, 30 Jan 2026 21:08:08 +0800 (CST)
From: Fu Zang <t1468150755@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fu Zang <t1468150755@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range for small delays
Date: Fri, 30 Jan 2026 21:08:03 +0800
Message-ID: <20260130130803.42858-1-t1468150755@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXfyE3rXxpDd4JJA--.6621S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw48JFy8tw15tr4fXFyfXrb_yoWkGrc_W3
	47tF42vwsxA3Z7AanrCa1FyrWfKF4rZw40qF9Iq3sIvayI9rn3G34DWrnxGFy5JrWUWF93
	Zr40vw1F9r1xKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8ijjDUUUUU==
X-CM-SenderInfo: bwrulmyrvqlkqv6rljoofrz/xtbCzhjyNGl8rTjALQAA39

From: Fu Zang <t1468150755@gmail.com>

The msleep() function is not recommended for delays shorter than 20ms
as it may sleep considerably longer than requested.

This patch replaces msleep(10) with usleep_range(10000, 11000) to
provide more precise delay control while allowing the timer subsystem
to coalesce wakeups.

Found by checkpatch.pl.

Signed-off-by: Fu Zang <t1468150755@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..97c923015279 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -215,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 11000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.43.0

