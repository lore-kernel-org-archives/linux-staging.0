Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3323636E48B
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 19:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564347; cv=none; b=G8nt3ODQaYDXHv61DzjnJwOc4I0QNJPAFR3HsgfSE7Ie8o4jB72QIlAjFtBjkxqD5IpdabMqR3idlg9XmG6ShE2rOQT8ZUJZg/LWYT2pI3eYtKpSN2DPAZaMvwbbFiivG2v2KRWN7Hhkrpl4yczV4YmBOJlXv1CN/db8G89X79Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564347; c=relaxed/simple;
	bh=9A7uZn6XarQXT9lfnNS60MagndoXgVcoNPy5rT/XCEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=L4Hy+GyhiD32PmaHlqbsHQnf1K+O10mtFp2DXyomJ0fD0EpvbCcP3nhs4X14srBcWmIbr3HUbgnEixd2obGTzJfxhkwh2Ep+cERuhv9LWCvly6Fy7MogUR/Sx4FlDmXE1boUG9+mGxKe4d2kgcgTd3mpypm9LlQyJu2Hzhu8fX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=NFKrCw52; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="NFKrCw52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786564344; bh=Gk/eq/qU0qQdoq4ti5CjuGa+PwAPs/q2v0lQ8WzJjA4=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=NFKrCw52x51ZmuP0XATHxf0HMFwNUO35jN4c9ULqNAr7mo5Zvc1yRJukbAsNwJggvZobwoi6D9T5w+r7ATCQ8A4FnbLSkUMGX3drfo1o/9AnsguL2SzB+uueofe8AgMnNrau0FOfqgXMBsMGYFHRahspUFjQoA5aZkleoW9uPjn/M6hdIOdxeDNG8OV6ZohAZ+HkgiM80y5u7FSFkongE6ygmo3FBer+zYnXUoWN4aPELDlVrXkmRQdp3tfSLnZ8kGMdOya9w4cmpfH9Lkz7LH4t3qztjCqd4yCertLg4Rzcv6o5ekteKV37IEJSlUqraIGlmvthUuUTU0Gaeg8WlQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786564344; bh=8p8M2/09JjsmkzrkdDrxs32csI/c0K+zbkVFfkgtVUP=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=OhzlB01nmRDujtNcJh4j4Ksguh/otGOxoQZyIuy/bcguW4P5d5okjdoR5ejsFYyZFGQ0GjpckkFXqF3kV/WAan0orIb6xPJveXRLHkQeCjdADKZmuh+EY4IZ/PWC+XAul9v5i+FTxLSvEefefTdj3u1RYbqZCLC2OaCa5kulURoPhO+qPihoYXyX614Hp1YwAT3hn8JlZnq8+jzfYqPcrY/OPvX8mVlSzw2vBLa92Uv//ZGj8kPe95hx8TFzmo4njOJbBYK/IvnXADo5iD0haJUfDZJ7jyj8hIJrD2TL7cwTkSccPD31vGjghhdOkC4fvuOUvS77he21lOJH2YpUxg==
X-YMail-OSG: .oYSB2sVM1kDkCigZaOuS8SgETNZU5_WwxPcbHC6uu2an4KcOK53wAX23aDkdOn
 9Nw6dqSmaZG.5v35UNW5utACwhsbClxrApSWFoZpgBRslTQapp7YIUZk2jU333Zx4XeGjPR99zDr
 tzo4Ycmc1g24ipjdSeG9aoXSSnle6S8VOt6BuCVxD5UYIg0qRbJLA1SlGr1pB7W26flfMB5B3gaz
 SQgMcylqF1AoLbWbnu7.5XJCpP01dPRMxcndzIXXT8w6YfyaW26rldh5gWbcuRO7tHdFTPKnZpZj
 kjbietPDqAhTSbuTsLxpDVFDOV0IaQhmrIbp_8M7u2XtOwoeDqFim8wE0cq5H9rU8j1j1xTeeUbT
 uKQkTInOvsmI7zGzSCA2l5mXHYhKW_Gmubtj.YWvTcwfmgK6EwmIPTNcm4yCs76N3ELtuWSS6AEX
 FMfiUGAKJ57o_hhlRfQHSEWnNqtukqXg4HfEVv1VTvy5vdGvzO5gqpPjGuz1Blcw6C5mcsfGpjLl
 kKPEeDK_kFBRpovSfXj88WyOd45Tq.6iVhDfOFqxeBUaGLoxMqKIy7s7rG36ZGzJWrEC3Fh14HXD
 1zUsb.Ayyibm9bqLEAbkhVmsgmWQwBe1MpWeoRWqEMAkYIDF6C59n0LJ4yaHaEoLf8bc0FdTEL6N
 _LciSvJP0JZwzJNUe5dre1tR9LTbMv0bX91mP.TXECNbyuuCZXYVfrWKw1ns6HmjRVQ4Xz9020Vv
 PiklPowgHmh4nhUh9kMdDtWAElVhJHGAwzZ8D5o9nj7jLDWDIjgy9OTpEX_8xBfMhKFF11Kr5H3z
 C4GY.m7IrKjrY3cCoRuznGYYQNzYtWIQlAoK4EfiE_32_BvYDa3jufRL5gJrHrQ74DlKATAY5T5F
 oJ48VtvbjwIBsAh_96P27XKH8auLltHnameWcBKU9JN0qj17vkGNslwVYTQ7wb6f0ln0LSNrmaro
 r1qRgKjcTXQRcnXvFr1NQMZc5QlxtkR8WWwwTNdVJkBzJQCJCgG8uZ6_NzRKywxX9j8wel8ETwkb
 0DvKagjYQQTUhRCm3R5sIrORAN7JDNy.AGC5EvWuQ.b7KeXfx7apKv5wjuqc71MKpdr91ODw.Tgd
 voTAqxe4CAffPl4hzDRI888wpkju1vGmdG0lfbwQYBXizilC7zMumB5550T.Z0D8xqr9_xa.B0UY
 HSO0MeQwA_1OxmKYFT536NetcECtrPa.P3SX_r4OO6TYXpN9Hdu8.GMx6DHq.XmKEYLrOuN5InnF
 yzpJbSMLTEVYbk.ZwLHqM39LlTtclYe7e1nctj5E5invO_D18saSBerlzVYT5FXxtyEQqfbPO4lR
 YuY2WznKWvD.NiecbIeWHTJ5BwLqSpfBYzLdtiewrjbKs2flfOHjmYar5IDrqSSdMqMWk2_DE.WO
 5wLpMRRmF4fh09DsQ0R_p.pRBXR9WAY3M4N35.vlwQkk4m6qP9iC1JhEdBs9PR63YFbCb1F8WXoQ
 j3OnwDFP_W_z8K4G8G9.9yc4CVXDtHlbeCxMpa1_JDdDl.kSvQS7c_.3bLQlGPzSKNRtUlKkMWfs
 v6VXOfRjUmhUAjfQozbGec9P8ioAa4IBVyU5fRp1joDJ_0ZQ7J72dw3QVfw6sdAPzTnK18k6mhRu
 9MAyjQylMenL78a3T1Rh5oDfJZTZ9Q0ZSX2gjNbAwo_wfn38QCaQKbJAkoNzrJHmib6ybJIDmp0O
 SEe8L7YoRAdu7u7m6C1C49AQtAVaU.aUO6Dq5APd4tYiHaxTb8C_p7NKuNgn4vGgpCVYzTK7Ir6v
 ANv51W0uKz4XaL0J9xruTJB2LXpA2JUW42E7DnO5VvSyGCHIGiRDWB9gABmn90hieyiE4WjUXrQJ
 bi6CVRdBMVFM1ygRYl_0UPKGONZmh2kV2wHuEUmk.WXnWLo6iOMDwCcwyCNkTk3Aj6XgkKew2yr9
 vP8b3.2qzihnMq0qfPMOcB05XSPXxszDACWdy_8hkXrrRHxtsbs.0zoE.cDrxGg9F47HpHMCXXeC
 D9vdrqSBeiQ36V9U2I7P2dFDxpr48US.eJsyP6x2J3LSKiVnSuZC9zcSyD27W5lo-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 018cb158-37f4-41c1-b6c2-3f812a33030b
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Wed, 12 Aug 2026 19:52:24 +0000
Received: from dip80.lsn.ir2.yahoo.com ([87.248.99.89])
          by hello (SMTP) with SMTP ID 74de38ddbeb494ec32238a5726025f6b;
          Wed, 12 Aug 2026 19:52:18 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Wed, 12 Aug 2026 21:52:15 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in rtw_mlme_ext.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rtl8723bs-space-before-tab-mlmeext-v1-1-805c85a2d862@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNywrCMBBG4Vcps3agSYtGX0VcJOlfjfTGTJRC6
 bsbdfltztlIIQlKl2ojwTtpmqcCc6goPvx0B6eumGxtj7UzliUP7mSboKyLj+CAfhZw9oHHYQT
 WzLZpTReDc+3ZUAktgj6tv8n19re+whMxf8u07x/01g1OhgAAAA==
X-Change-ID: 20260812-rtl8723bs-space-before-tab-mlmeext-2341dcb88491
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786564338; l=1686;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=9A7uZn6XarQXT9lfnNS60MagndoXgVcoNPy5rT/XCEg=;
 b=xOPyk2trVqNzcqMNOmaGlqAEu2ohLAbwLY8zp8l6Fe10mNbhQ3vWidlvU1DHBRD7MyAiM2u11
 Pp5apoj7nPzA+2UilyxxJ4n827ZHHHsqjO+eHYO+rfRAeO2wZbea3ag
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260812-rtl8723bs-space-before-tab-mlmeext-v1-1-805c85a2d862.ref@yahoo.pl>

Replace space-then-tab with a single tab between field type and
name for ChannelNum in struct rt_channel_info and
chan_scan_time in struct mlme_ext_priv, matching the alignment
style used by the surrounding fields.

Verified with checkpatch.pl that the 'please, no space before
tabs' warnings were present before this change and are no
longer reported for these lines after it.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index cb23c6939bfc..e26517f942a7 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -322,7 +322,7 @@ struct mlme_ext_info {
 
 /*  The channel information about this channel including joining, scanning, and power constraints. */
 struct rt_channel_info {
-	u8 		ChannelNum;		/*  The channel number. */
+	u8		ChannelNum;		/*  The channel number. */
 	enum rt_scan_type	ScanType;		/*  Scan type such as passive or active scan. */
 };
 
@@ -390,7 +390,7 @@ struct mlme_ext_priv {
 	struct timer_list		link_timer;
 	struct timer_list		sa_query_timer;
 	/* struct timer_list		ADDBA_timer; */
-	u16 		chan_scan_time;
+	u16		chan_scan_time;
 	unsigned long last_scan_time;
 	u8 scan_abort;
 	u8 tx_rate; /*  TXRATE when USERATE is set. */

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260812-rtl8723bs-space-before-tab-mlmeext-2341dcb88491

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

