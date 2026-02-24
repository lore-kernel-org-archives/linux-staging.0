Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0391ADC83
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 18:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771959314; cv=none; b=G6BqMQ6YR8yXqPA2G4g9bNsIFEYtjbR0k1kiUQbwyUhK8OhxvrgwxpctNT1jFTPoertVvjJEexcjWrC8UzGe/NaNkrp2Gg8rXbyyCpjPQxnNRfMmi4hfYDgNhPOds21WWEZgtvzwYBOu4JLEoa0hsrqGYzIO5TOf/FNeGx8fZlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771959314; c=relaxed/simple;
	bh=Kl8cL99lfSpUtDgg6mYNf0ILtuKuuEtwDU8t89wUAlk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r6xCYSxmjyuqWOZ/s9NVOpagNGjX88Sz6/2mr/Pqj63hn4BG+htUxNN+meIR1igU3Np5Fr/8ZVM9FQlySO/obYHR2G75PnmoR/5V8l/60rjADT0mvqsFTeVBfYjM9E4K2z+fBCOGuajLF2PRWcVpC61f+XKA+PsYn+1C+C0eYok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dWuZ2AfK; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="dWuZ2AfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771959310; x=1772218510;
	bh=Kl8cL99lfSpUtDgg6mYNf0ILtuKuuEtwDU8t89wUAlk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dWuZ2AfKQmaXikae5oESe0j40qUqHOPM2CvUb01cHe+o5ofU9HmJqGxaansJDVTJE
	 Oia6dJUttjuuMuvHXyNvwVTTfN/xqsXAldwnLTrBTw4pGXYKp8iy1jEN++VWsFtsI6
	 JZ7mSrk3Tqrn8m23xbOUI8YfdlxmHavT44Wq48PTUMMr2gT2twimmQ9jBNDiGhN0Mg
	 VTPYtymUHCHOVZg8X904zWQS5oOH1djI9N4fdXtjIkwNrA7RyjTjDTMN3RRUbN3IB3
	 dutewSYsAcA9J6Q8XyBKeMpU0dwOUlVkxQTkrmRdGzPUnydhpaintxKbwrCn8as7dn
	 wh6alJJW2WFuA==
Date: Tue, 24 Feb 2026 18:55:07 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hardik Phalet <hardik.phalet@pm.me>
Subject: [PATCH v3 2/2] staging: greybus: audio: drop stale TODO comment
Message-ID: <20260224185421.824210-3-hardik.phalet@pm.me>
In-Reply-To: <20260224185421.824210-1-hardik.phalet@pm.me>
References: <20260224185421.824210-1-hardik.phalet@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 3bceb23eaaa3ac5046980882608cdb28ad275398
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Modules are removed from modules_list in gb_audio_manager_remove() and
gb_audio_manager_remove_all() before kobject_put(). The TODO suggesting
list deletion in the kobject release callback is stale and misleading.

Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
---
 drivers/staging/greybus/audio_manager_module.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/stagi=
ng/greybus/audio_manager_module.c
index e87b82ca6d8a..97d67989b181 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -69,7 +69,6 @@ static void gb_audio_module_release(struct kobject *kobj)
 =09struct gb_audio_manager_module *module =3D to_gb_audio_module(kobj);
=20
 =09pr_info("Destroying audio module #%d\n", module->id);
-=09/* TODO -> delete from list */
 =09kfree(module);
 }
=20
--=20
2.53.0


