Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844A81E0DFF
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 18:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729188911; cv=none; b=Pcx6mA5pRRx0zfQx9LhgmHs/kuCJZqr+tVFQSGT6raP5aNCmuyEMRnh/HYV1uJ9978JQ+4eu/w3DB3BCiberjFQXAG2g5KXTnC0MXv1m6+B7XN6kPe0/sYMFnhh5j7bLjTV50nrX+PD7ZJL/xadtFjZ+0JfbLCc5EaUFbwAf5Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729188911; c=relaxed/simple;
	bh=ZRBVMuf3iS06874jBQgZMTEyL7J5rBorbHboD1GR5y8=;
	h=From:Date:Subject:To:To:Message-Id; b=kWkMF9GoIeQ94TljJF7vgIz+RGNXsuDbptaop7ZH9MSzjzEC1E/HnUadFSMraP5E9AqlWzyB0uPHicv+aql1lPlFPMnBc16o4BtCOLobrij4hN9rGfWPJD9VbHJMQpAwut/SGWwUtU7pObQfmkZQdThbuUvdNRUvFX90G0SNxJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=Ik6MvB3Q; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="Ik6MvB3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729188904; bh=ZRBVMuf3iS06874jBQgZMTEyL7J5rBorbHboD1GR5y8=;
	h=From:Date:Subject:To:To:From;
	b=Ik6MvB3Qn9+bmefMrG5zZIEUzlX/u3CABqTNZ5Zc5wtZHi0VB4ilbTgry4gsBBazq
	 mW7hM3DTVng3dmCpw6GSSQ2fgVvuG8G/YLdGfyuXwbJaJkcRKDkkRGHxYbxeY3SxHY
	 6SrVQHwRqRKW/UEv8EGlh7YQFT2nbNPZHZiZ5v9yGebfmn9axkKdxgbH43seBa6Wgi
	 r1yCVb7+rLb+hmkpwpHiuvISlE5tW5eGi182A/NovV3+jHw28SR4c0PghTlNhSG8Cg
	 WkhWb0Fj1GowDc+z+W94fovThdWom9z1ONClgfOJQ40oq8UYRuW5ttdszl16/Z6o89
	 uW/BL1hP43xLvQeUkSkRrlqZx/OIB27CyA7PH29NLziuI9IhsPEZYck6RP2ZqVhdiO
	 kqovExvae/DqGcEjjyqxVoQvu4fh2nsSSE2wdZlW6UlpjRPKU9vVNdCjUzI2X2VvQa
	 zjrPqXlwWXh27/AHk0rP8nk9xv84UO96IZsLmw/+GVDEKFLLm3UZgbFgXmvQs69vYh
	 iTSr6ZkwhN0iQBw+eiqD7A1EknftRD/ghGOkkLun6R35iauCk4/F8rRrx5hyYlc6WR
	 ciMaq11OaqBIwncS1QZMSTZPk24KLggXkSAHeoPZXurCGoOw8OFv42xXVUAfuJoc+z
	 yXnkJrE+D5H5WO0uDQWDzs9c=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id 1346F18DAF2; Thu, 17 Oct 2024 20:15:04 +0200 (CEST)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Tue, 15 Oct 2024 22:33:30 +0200
Subject: [PATCH] staging: gpib: Change return type of fluke_get_dma_residue
To: Dave Penkler <dpenkler@gmail.com>
To: Linux Staging <linux-staging@lists.linux.dev>
Message-Id: <20241017181504.1346F18DAF2@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The function fluke_get_dma_residue returns an error as a negative value.
So the return type must not be unsigned.

Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
---
 drivers/staging/gpib/eastwood/fluke_gpib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index f9f149db222d..77bbe2b587b1 100644
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
-- 
2.47.0

