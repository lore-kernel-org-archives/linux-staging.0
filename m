Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46B7191F91
	for <linux-staging@lists.linux.dev>; Sun, 25 Jan 2026 18:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769364802; cv=none; b=OtBqioCDFG8BtA51Sh1WFPOu7nwjbK6L7+tB33xU5/tYy5OzgVYrkWH52RQwWaSYYjg2CQB3grPLcU0i7xBQZmBvllUL2MvkAaD+kaxep1MzrGLhx6QDPM8/uQ+yzMThRxORU7R0fG95yvkbp1BOTGnO/KmpxRf6LOEsTxLsFb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769364802; c=relaxed/simple;
	bh=Xyt5xkDjPSt+kNpUIJkRB6elwGZgU0sku3179vocm2I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i1eODFaByHhTDjfGBXi7qecAqJKZ3bImHYtQwtkZ+uIiSeYZPrl4yr9WI1nL07TcFGcvOwZap0sKmubCTVwJ1WkRxICHrvxCc05/MVw3Wns0p5YiV8UWU22jFJqLc1GO+TqFW6m6q2ojI/tl/4oyeU3VbKmypkqGvj32TYn2D9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 7A936583A1;
	Sun, 25 Jan 2026 18:13:19 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf02.hostedemail.com (Postfix) with ESMTPA id 3E6CE80009;
	Sun, 25 Jan 2026 18:13:17 +0000 (UTC)
Message-ID: <e87acd109ea5eb4e3f8fc233788cd0dbd128407d.camel@perches.com>
Subject: Re: [PATCH v5 1/7] staging: rtl8723bs: use continue statements to
 reduce indentation
From: Joe Perches <joe@perches.com>
To: Michael Huang <tehsiu.huang@gmail.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-staging@lists.linux.dev,
 	linux-kernel@vger.kernel.org
Date: Sun, 25 Jan 2026 10:13:16 -0800
In-Reply-To: <20260124231557.18189-2-tehsiu.huang@gmail.com>
References: <20260124104920.5721-1-tehsiu.huang@gmail.com>
	 <20260124231557.18189-1-tehsiu.huang@gmail.com>
	 <20260124231557.18189-2-tehsiu.huang@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: 8wtz99x7zo7rqaw6mnd5aj4rfwzkipc7
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 3E6CE80009
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18mr2eoVvmuUVJRLo6khf45BtgCb/Eks10=
X-HE-Tag: 1769364797-649068
X-HE-Meta: U2FsdGVkX1/0oIqDJKx3fLbkCZN99lQ+4R0kdSW+6jGUNRfQCG+M613aSxYB2cubpktDkjJmToMDbGyQKo8nf1JIsnVlifZ0NORApTlEJSXqew0iqIKOl4us/Do0bRdSV0YQSM7tDyGdQIplkSmzoc+wnTH+F5yUtCAgbafB9G8KapXYbl/Ov3/6dNXXQxVQ1N9DAC7v0Y4/GZndxS+3Wl0iGVT8hYoyJFO7bJFqcUlk4Pzphk7rrhZrO852F8fixAaSLhaZJLlwhfIjMqyR7ZlECZ1EEfu7bLfG7EWCamHshbgXv3lzZJO2HwOnQKNJ

On Sat, 2026-01-24 at 15:15 -0800, Michael Huang wrote:
> Refactor nested if-statements using "continue"
> statements. This flattens the logic, reduces deep indentation,
> and improves overall code readability.
[]
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/stag=
ing/rtl8723bs/core/rtw_mlme_ext.c
[]
> @@ -3684,29 +3684,29 @@ static void issue_action_BSSCoexistPacket(struct =
adapter *padapter)
> =20
> =20
>  		for (i =3D 0; i < 8; i++) {
> -			if (ICS[i][0] =3D=3D 1) {

Several additional things to consider for readability

o Rename ICS to something more meaningful
o Separate the ICS[x][0] uses to another named array [8]
o Adding #defines for the array bounds 8 and 15 (or 14)
o Change the loop bounds from 1 to 0 and 15 to 14=20
o Converting this/these arrays to bool
o Use boolean logic
