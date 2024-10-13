Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D935231CA0
	for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 19:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728848748; cv=none; b=HS0bnhYQqGWUS2El87PqhtoctZtwHlV77UO5P/F4VYTQjLH4q6zTOtpekaZjuclCsF3xbpNDxJR/D/RVPW5omsedoimY0N0cI9tlf+K1BeYKRqy4MixeGiZOOimHYit3wEytPmykHJDti04z1g54unr2voJC1EPnKt3bFV7S8oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728848748; c=relaxed/simple;
	bh=5PL/DzJk9M6Ksey3MnCAtp3ggcM75u+uEq5pEsQUfFw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=o/lNoIngzroJWADccrk8qbD3Q8eFBQo3bKTwzRB44Lh+PMnbSXHcmpEbPS77wPSMzL+EU+b0PfJWeWQkLD22BCclq0LnUwpZxVwXiax+8f8KWv42rB5jnGXCUg38Mv+FfoQ0IYHhaOzchJFIBTAAnmZXIGGCCfx7o0IurOKgtEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Wm9ciXPr; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Wm9ciXPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1728848736; x=1729107936;
	bh=5PL/DzJk9M6Ksey3MnCAtp3ggcM75u+uEq5pEsQUfFw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Wm9ciXPrNw8h/Tn8oye5qOIUbqRYI+2hlFQGPhSuon4US1nQih2VZxdPIVWF7Gybz
	 WiOjV02vxmJx/L2busE2bLa32WzZQVnESh8hfFIr83bdQ9v88TzHu4JVzIwkOZSp4H
	 PcuMgp8Qo+Rqy2HKzwU2aoTBWaEWY5E73Fw1ThMH7uiW2Ll2XfQz3OFeunML5iy9Ht
	 IOW6ctmud7vD6G/8XdfmtOXBx0SfJ1Y/xctJwbLVC3HDrVKnWRrkGjevHJ4l4Lv0vs
	 yTVVAmAYT5LH+HaLBa70pRlvuSe1EF1q4waZcCAdsQReI0HJ0DwpjmpZAEd6+ExxGa
	 ZLki87i70Er2w==
Date: Sun, 13 Oct 2024 19:45:33 +0000
To: "dpenkler@gmail.com" <dpenkler@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dominik.karol.piatkowski@protonmail.com" <dominik.karol.piatkowski@protonmail.com>
Subject: [RFC] staging: gpib: Proposal to add TODO file
Message-ID: <9kl5ApXnxfAqT4f8YvoMMU8hLdNC_Dd3ZfZj5UEGrLfWKU_PnImmkF7ZIFgiSq_Qt06oFVAQ04JfzSwfXree6_ZZ39c9d58Gd3rxCCZ2jUw=@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: 3a7087128e7e758a5083bb3b844d4455e63c9f65
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dear Sirs,

The gpib driver was recently added to staging-next branch, with patches bei=
ng
few weeks old. It is currently almost 30k lines of code.

I suggest adding a TODO file, as majority of drivers in staging subsystem h=
ave
one. There are some things checkpatch complains about, and maybe there alre=
ady
exists a list of known other things to do. If such list (or lists) exist, i=
n
any form, I can prepare a patch introducing a TODO file for gpib.

Thanks for any response.

Thanks,

Dominik Karol
