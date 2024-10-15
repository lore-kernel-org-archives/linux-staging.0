Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F8B192D7D
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730749239; cv=none; b=kHdqpJf13LkEmF6jG9FXeTfQtaMf8+kCNA8MX6RaTYg9HSbqkacWcQ/UZTf8uYcGEMIkQMm90llUSQTERUkuwchWb+1YUddTsdRp8Q+CLEc1FKG1+WjhMOnSKXSMdcbemc6LCr+HTOjB2wSF44NJJ3g1THV/d7/1wCcXJh5Dg/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730749239; c=relaxed/simple;
	bh=wduOPLqo1PgPH4ZCh7jh0rk85MoTwCkMuwZwZElLMjs=;
	h=From:Date:Subject:To:Cc:Message-Id; b=YNPS+MHBo3rzsjdkNk36x4mW1RqCsiX7fv4dbYrUZqpTsSyhKGJQbCxrF6BPs3sCil4deBEqT2lUKWMvVVsrceT7J4ZcBTfbMDi9qZZ03EtRj/tVQsoRfQwzATPKmeMhF0f57uai8j9YkD1R1RZl6oV+U4FAdlL/OQmAMJwFoNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=TV3hJjFG; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="TV3hJjFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1730748827; bh=wduOPLqo1PgPH4ZCh7jh0rk85MoTwCkMuwZwZElLMjs=;
	h=From:Date:Subject:To:Cc:From;
	b=TV3hJjFG8rhI+l9d8jgGKAmzn+b8AEJ+UhPoGyx90vMtXOtqCBayim+GSpTwZvm5+
	 sQ6Fk6suUpax7RUzTHsYRzfWGTVVYlQtrGdQosP56UlfdoBfRdkgqJMCq8hNtEvruH
	 GRClcJybGpPU0SFAWKCd1PrEXEubb5eigU2GlVChXIALhwJ/lLN1ZE68cFQ1HAoicd
	 NNiVxrUp3vhhqQQXdHQS27lMDDxSN62ruObbEFfdUoiKULXg0npcHU0eyNfy0Uy1XJ
	 SZpIkbkUmXYJiNScbGX/iklWHEUsyZPe0maXj4867n9MPBxnWhw0QVmWN1wWAKRXZx
	 xBpPsy9W1OQOxrkvB8WywW5loueOb3Wg99rmf6ercErXmT4Tm4Itdl33dGpo90taJZ
	 Y/d2uKc+9Kexh2R0Dx7Q2qE9c8/i8dX4cDErMjYLf2NfNKL2CcG/g0U9qcsC9oGNXg
	 aYspAusriDtDGNHrNXvrmcUH9U2jhSOBdKCw+yowMjsGcX78kQS48a5gAjVFmxnOzA
	 7EMMJ93F1v3qWWWQ6gaa6u16q2VOahcS4ZePUZAOLhxTbi/aQIatynw1h1BZ8U8WHd
	 8SK6+zej2jk3Eq2VpwUJyhcOmZ1yWMHN36tI78/1Zh4MwT+Hz5/ZP8n3WKWhVXS4k4
	 BnIJZluHJvQYEP8kN7dL68HI=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id A0B5A18DD37; Mon,  4 Nov 2024 20:33:47 +0100 (CET)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Tue, 15 Oct 2024 22:33:30 +0200
Subject: [PATCH v3] staging: gpib: Change return type of fluke_get_dma_residue
To: Dave Penkler <dpenkler@gmail.com>
Cc: Linux Staging <linux-staging@lists.linux.dev>
Message-Id: <20241104193347.A0B5A18DD37@bout3.ijzerbout.nl>
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
 v2 -> v3: add version in the subject (sorry Greg)

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

