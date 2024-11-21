Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34251CD1EE
	for <linux-staging@lists.linux.dev>; Thu, 21 Nov 2024 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732202554; cv=none; b=eVHmix+/p4cxYrxnGfhvWkzoms0GSfc++i83+7QsEy5ONaVC09g9Avj3GBdj2J2rsLmgeAH9RlioWz1DnglOYKBJmLSqVCwkSfY8FfaExgf42iM6t6taFiUAd6gmef8ZehAHeT9KT8qBzYe95wU7JadWZK2C9vLC+/GKbkNOzzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732202554; c=relaxed/simple;
	bh=J7W5TrnwenWvKnMX3d2yc9yTu73XYLUKgJ/OUeyUX0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FG7rudEhneY2SDMI2G48mxWzdM0nMHTuEp40bdlw44nHr/TlFtXkQ2vtMhI+TkV6waRhjplhgRIj9qvQH6X3Pni4+V+fkxz+gl1kLYHI60QCl17Vb99bxlas6zmdtEagEG1tKsF7PxIyNpEV3bxYhETtPgbLvTAop6qf/oP9nvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x+kfQ4v+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qCXoi7Z+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ekgrctxf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9CE+WNgv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x+kfQ4v+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qCXoi7Z+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ekgrctxf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9CE+WNgv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ECF4E1F7BB;
	Thu, 21 Nov 2024 15:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732202550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K91uPR6lTMWLrN85XaN0xXrhmyBOJcTrqOt7sb4zvpo=;
	b=x+kfQ4v+gkgO6A/oKcfRPTIvji8WdVP8x44FpIaXOgJRJkXS798LSc+8Mfg604Xk48wngm
	FnVQFaamIajw5C0DZTjaumiwxyhjbu46z7qQMsI64k0/oq8ZArwD9/JyeAu8J6auwYxI7x
	pT5Sq7M82zZXMba7dGkFV6XfKq8WL0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732202550;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K91uPR6lTMWLrN85XaN0xXrhmyBOJcTrqOt7sb4zvpo=;
	b=qCXoi7Z+uW6XlcWH5L6a6QrAsNHRaKoAlv/lpti93UxgGBZ8hcNzPnjFTATnzfXR/lwH7F
	tjkTFpP7flEmtpAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732202549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K91uPR6lTMWLrN85XaN0xXrhmyBOJcTrqOt7sb4zvpo=;
	b=EkgrctxfRJZxncdpcrJ/S8xVA88eefaF6VX77EkSVHFAnZhf3PvyuczUj/YWNHDj+Pkns2
	Hq2AzIMpGsJs1ixNNix546mrHYy44mf8n60LWTzJyKUqHv4rk+9ZHBLC/wg8G/6Blie1Ej
	PbUVDoNX0cg9Vyql1zyvhqm56FZmwwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732202549;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=K91uPR6lTMWLrN85XaN0xXrhmyBOJcTrqOt7sb4zvpo=;
	b=9CE+WNgvayaE0kDDafV9/OTZx5ZOHnmPQwcDm4xhdPMVv3n3yeYu3ehjC9hc9BfoCX2o9Q
	omFAVaQxdUAkuLBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C698137CF;
	Thu, 21 Nov 2024 15:22:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VS5cIDVQP2eaSwAAD6G6ig
	(envelope-from <pperego@suse.de>); Thu, 21 Nov 2024 15:22:29 +0000
From: Paolo Perego <pperego@suse.de>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Bakker <kees@ijzerbout.nl>,
	Paolo Perego <pperego@suse.de>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] staging:gpib: Fix a dereference before null check issue
Date: Thu, 21 Nov 2024 16:22:21 +0100
Message-ID: <20241121152221.6415-1-pperego@suse.de>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,linaro.org,ijzerbout.nl,suse.de,arndb.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Flag: NO

This commit fixes a dereference before null check issue discovered by 
Coverity (CID 1601566).

The check at line 1450 suggests that a_priv can be NULL, however it has
been dereferenced before, in the interface_to_usbdev() call.

After a discussion, the NULL check is useless because private data is allocated
in attach routine and freed in detach routine, so in detach routine the pointer
has to be not NULL for sure.

Signed-off-by: Paolo Perego <pperego@suse.de>
Fixes: Removes a useless NULL check

---
v2: 
* After a discussion, we agreed the NULL check is useless because private data
  is freed in detach routine and allocated while attaching. For such a reason,
  the pointer has to be not NULL while detaching the device

 .../gpib/agilent_82357a/agilent_82357a.c      | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index bf05fb4a736b..e940429dea19 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1447,17 +1447,17 @@ static void agilent_82357a_detach(gpib_board_t *board)
 
 	a_priv = board->private_data;
 	usb_dev = interface_to_usbdev(a_priv->bus_interface);
-	if (a_priv) {
-		if (a_priv->bus_interface) {
-			agilent_82357a_go_idle(board);
-			usb_set_intfdata(a_priv->bus_interface, NULL);
-		}
-		mutex_lock(&a_priv->control_alloc_lock);
-		mutex_lock(&a_priv->bulk_alloc_lock);
-		mutex_lock(&a_priv->interrupt_alloc_lock);
-		agilent_82357a_cleanup_urbs(a_priv);
-		agilent_82357a_free_private(a_priv);
+
+	if (a_priv->bus_interface) {
+		agilent_82357a_go_idle(board);
+		usb_set_intfdata(a_priv->bus_interface, NULL);
 	}
+	
+	mutex_lock(&a_priv->control_alloc_lock);
+	mutex_lock(&a_priv->bulk_alloc_lock);
+	mutex_lock(&a_priv->interrupt_alloc_lock);
+	agilent_82357a_cleanup_urbs(a_priv);
+	agilent_82357a_free_private(a_priv);
 	dev_info(&usb_dev->dev, "%s: detached\n", __func__);
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 }
-- 
2.47.0

