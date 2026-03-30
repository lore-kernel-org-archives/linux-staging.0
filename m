Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719C2391826
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896407; cv=none; b=YgkFUeWPGB0g3W3V7WdPe5CQLbMW8tAywtrmdSZ2xiT2PIA0FNyKbYeid6yMtUGA/5g2DMhLXQeVWqS4H1JEdV6m8TjUt/CLWpps5kg27Nc0jRKMM4oEdBbJPx/FSsglIQ0jbTYhcgbuuMvlD6INkNio5x5XAeu2P1MVQiExiAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896407; c=relaxed/simple;
	bh=alEMOyExqa1lXRXZUf3Aud+UkPEN5AmkTXeW7AdEtAo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=r8vOtj/n7ST2zFgyEhBIa9qa6OajVr/0gQ57cY3BZtDqrCPtSnnvzqAR/Rmb5UzE9LPfLakN5CcHPe5SL6tWVtFqShWIuZjRpGYfqcf0ULdhGG+vdRh08gI2+PLBx8kQVEPv9/tjzOkH/J5T6VGIY+I8rikc9UmBp1TJ0KmENeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9bVgJ9D; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9bVgJ9D"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6501418152cso3288962d50.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774896405; x=1775501205; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alEMOyExqa1lXRXZUf3Aud+UkPEN5AmkTXeW7AdEtAo=;
        b=U9bVgJ9DZWSOYJeY0uTzZrBd+xY6Djfj74zpwRHssVs+717j6HaG9nvF7vqYpFntGY
         spD1lQ4cPw9QAHyG6P1NkwutgpPyEUfhIr2HXnd6V8U9CN/8P0fSdREf/0ckAhdBSvPC
         vp6DzBSm3s6V00ZGiDrmWjJpZGtbdRNi3E/tSt4wojMCNTcwJznpXuOfUC//xZJm5g8H
         9/+SxnZSytGMTXU9tH6ioUgqCncAJcT90PUTP4ArMOlNrHjplE04ghigltK7zAE7hh7Y
         FDIrr/yttt17KUEfbHWi96Nqd+Cm9b2Sn60+Om2BLYr3C2hBDzIU0VLC3o7dmmYP2Uqq
         yXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896405; x=1775501205;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alEMOyExqa1lXRXZUf3Aud+UkPEN5AmkTXeW7AdEtAo=;
        b=HJpHcO4zZ+zz3lcd2A1t8GVu9RfnGfZpFCR4r61IOMN/l59HA6SXEFMcRh/529oaUb
         wOfAds70dNeDd6R01z5eGp5373E2BXLi6/kkZUDYsyjgl8jHKMG0NxAliYXFAZ85zwPB
         kHaGIEi0ud5DKbxoS37C3gXssr4HjYvImJUEbwcXkMfeCbSkTskwtbBeEgw+Gfb6OhCM
         4pPJktm23ODQMSNs2az7hJrYwNBBdryZG+ykf02zhgnm/9Wz+j47oB5ZS/U7UktQoNUF
         28S/JuQ5mEayTazj0i8C6Io/eiI/0Eh5l5J9hMzndzgy1oVQU25lQdER+JvVobfY8zFj
         t9xA==
X-Gm-Message-State: AOJu0YzAMpwGpDeJUPTgKs5UksJ3ZpWE7ZrjXvFP0DT9vf8JMqk6CFz8
	57otVxUhDR2y+6MJ/MJJLZPQcNpgzznr70WaNqkS3TtcfhGEraOU5ziH
X-Gm-Gg: ATEYQzx0c/uVWG7ZGL7D8mXhkO3m+5RTVGfXEDK+8637EBghKR3YACdp2Fr3K0mDHYq
	Dz9Oo455/hid9k10uZDNydzmcThOetgV+onKKA1He3m1S8oyoR23H101G+6L+cnt9FHLAU1A1RS
	G6uirdugGuT1oTJ62vFkd3X9qFEU3/Sal5hYy32tzveMx13iSWBDW+Wc6DEE85vnua3QLNnIyqL
	wMSW921tbtIaBaIkwU+DIjs/yfExhtU4jzV3cvNN21FOCBn5zhqs+K2W1fJfBj+/YLZs7bkUXgg
	DJAeAqbPK1us8v+LgJc9VD6K3AWAYcomgQRaHi6Hp+eQDgPV0dBzqmsIUaIR7KInARnokisaj1+
	nvYMEBgDOALh+tbYYVXCXPi/L2lRGjRcxoX3mcPDf98/OCYEUMfUf+Jc2JtSF+aDDnZIT7ffqD1
	0t9toYjHACBtmps4fzE05gq8P/k91SSMHEMvvrVmQQXPOD+Oo7FKPM1FH3EJZamQO4xwwvhYN7p
	tA9WKtxKkH4PvP33bv0yYVpfQz+YJtrr6N7fKQ/sFg=
X-Received: by 2002:a05:690c:60c3:b0:79b:ced2:fa39 with SMTP id 00721157ae682-79bde09e890mr138709717b3.57.1774896405294;
        Mon, 30 Mar 2026 11:46:45 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79cb7135b97sm39043747b3.1.2026.03.30.11.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 13:46:43 -0500
Message-Id: <DHGC9JAQ7IP2.19W9IV5RR8BCT@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <kaizhetan@yahoo.com>, <arthur.stupa@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: add missing blank line after
 function definition in rtw_io.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Juan Angel Hernandez" <hernandez0101@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260330175038.14675-1-hernandez0101@gmail.com>
In-Reply-To: <20260330175038.14675-1-hernandez0101@gmail.com>

On Mon Mar 30, 2026 at 12:50 PM CDT, Juan Angel Hernandez wrote:
> Add a missing blank line after a function definition in rtw_io.c
> to comply with the kernel coding style.
>
> Signed-off-by: Juan Angel Hernandez <hernandez0101@gmail.com>
> ---

This has already been resolved in staging-next. Use that tree when
submitting changes to staging next time.

Thanks,

ET
