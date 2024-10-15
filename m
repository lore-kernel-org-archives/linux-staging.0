Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588C01DA21
	for <linux-staging@lists.linux.dev>; Sun, 20 Oct 2024 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729438801; cv=none; b=QUUrtXGSlYd1k+K85xzGh+AavLyMaVUKogJltL2oZtPC7HB1vjoth28h9CX7RsPAR7eqBiVtBnKt1Fit6+vvzAjwZqONIEPOnGDh5avmIzUa3CKd+a7EUtgFhE0+a7UERxFJpSsCQ1v3X0gZFhTYpQAu1YlN4RKvDRauhLHDq0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729438801; c=relaxed/simple;
	bh=/JbQB7oMMz4KoEq7dRoKtZWOLFmHf8MdhzIC3KJPH2g=;
	h=From:Date:Subject:To:Cc:Message-Id; b=raHtKHEU1H4Z89XaVHEaGAmDpbZVkm8Hsf9AhNenkzHC7i+MWZSqHo8f1wUW23UN+r+3YHuUxIEOUYH7xCa43F6Q6J4E0nM1BBl1EjTNxpJj9jlXh1AyoWhGQ/tXdyEPORmBAbnWtSP9swkBSh0W4Se0JL1XulVBbPx/68fJ/ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=moNgd3zC; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="moNgd3zC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729438788; bh=/JbQB7oMMz4KoEq7dRoKtZWOLFmHf8MdhzIC3KJPH2g=;
	h=From:Date:Subject:To:Cc:From;
	b=moNgd3zCbjKqPpxvQmHJ30iJcc3VEv4e+k2NGQNI86uR5IeOOb+awGH6NkEFqCaRp
	 2S07E5w+Hd3zcI4La+GafOhMfHt0fAdjkh35mA+lKIdS/N8FTmns8kDCKk+5u0rdAW
	 syGTqgxjPBGEcZYVM1FAgA+oMvc2Bd8wGTvtyJKlLvWwI+1K6luNCcqMYvhF6aY+He
	 GHUPf+GqNe7VvwJd8J71CLSnmKaTJCPW5LmcuL5Vxyr9PwPRI3uRddzyKSihc1RfhC
	 KB8kxYjIKxyPuUUxIZqbsNkvhsZXYz1qwF7cOtkUXRt66c3vNTeKfce6OfBQBh6ow3
	 rJWUpepA3/03DtCPyZabpLyZoeZJYFXtJm0THEeHeGjT7Hdib5I+1TRVFlm0YUXhI+
	 xKRuW4bnK9Cr8vozps2xSeu5ipJdfFt/e9ngOj+4kaXlxWmrHQIAKTQKb0Rg18S7w9
	 AyQlLb48+LOOvsLXxGevlRHRMHrfKe6bTObq+XbaE5jt7ub6MuUjQTJZiFVDNpD1t+
	 8bjXNOoJD6Huyu2C75MCfR+zS7SfmMllebKqBcMXUPhzXpllmyfMAR3qLtjdLow7IJ
	 BtYyClV05HjVCYdIK/r41zlBSQwtMI6z0KrvRFiW1m+s24Z8xnKSRqZcjuWclLQJOe
	 2px5UyxxwPymYYJ0KRb83fBg=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id B607818CC05; Sun, 20 Oct 2024 17:39:48 +0200 (CEST)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Tue, 15 Oct 2024 22:33:30 +0200
Subject: [PATCH] staging: gpib: Change return type of fluke_get_dma_residue
To: Dave Penkler <dpenkler@gmail.com>
Cc: Linux Staging <linux-staging@lists.linux.dev>
Message-Id: <20241020153948.B607818CC05@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The function fluke_get_dma_residue returns an error as a negative value.
So the return type must not be unsigned.

This was detected by Coverity, CID 1600782

Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
---
 v1 -> v2: change type of `residue` var; add note about Coverity CID in commit message

 drivers/staging/gpib/eastwood/fluke_gpib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index f9f149db222d..3843e986f104 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -536,7 +536,7 @@ static int fluke_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length
 	return 0;
 }
 
-static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
+static int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
 {
 	struct dma_tx_state state;
 	int result;
@@ -549,7 +549,7 @@ static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t co
 	dmaengine_tx_status(chan, cookie, &state);
 	// hardware doesn't support resume, so dont call this
 	// method unless the dma transfer is done.
-	return state.residue;
+	return (int)state.residue;
 }
 
 static int fluke_dma_read(gpib_board_t *board, uint8_t *buffer,
@@ -559,7 +559,7 @@ static int fluke_dma_read(gpib_board_t *board, uint8_t *buffer,
 	struct nec7210_priv *nec_priv = &e_priv->nec7210_priv;
 	int retval = 0;
 	unsigned long flags;
-	unsigned int residue;
+	int residue;
 	dma_addr_t bus_address;
 	struct dma_async_tx_descriptor *tx_desc;
 	dma_cookie_t dma_cookie;
-- 
2.47.0

