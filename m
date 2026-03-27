Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011153C6613
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 17:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632445; cv=none; b=McG6jPbT5pfgvxtthVVEIIv//r+4WDr9exFOsn27bu5ECjDvHhh1mws/8J7J9vg1h/st8te4sHYevAVJwXQu5XV6YKV5M3/WqpJrsa+XaUcUZHHtZxYsnNlwNwAFpGDjXAymgnCKHFLW3LH6283iaDSRwaNVvzIf9OxSmvlKyBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632445; c=relaxed/simple;
	bh=Y6OTb3CPc2xv3jHEWqe425hW++ZxF7VSN1yizPSIBQQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=j/ZuDRsLlcUHLrJcVICeJAnjUK8mHhfQSRQ8zCsLeVOnv6Fbb2x9HvA7xI3EkY1lQQNepx2SJlGb+2EqrZOT/hk/MtBRGw0yH41VTHdDcdeyXi//ugN53+RnSq4Cbxfw/QED6mX5omT1IO0Rmy71u31c2f324mrrjEVuHHJm2VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmpSwRVa; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmpSwRVa"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79801df3e42so32790957b3.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 10:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774632443; x=1775237243; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6OTb3CPc2xv3jHEWqe425hW++ZxF7VSN1yizPSIBQQ=;
        b=lmpSwRVarKED/GMWd8D5445QQmCr0deDi3FrBuu5q6rJQO+yM6eBZn+bRmUh29t52+
         Jjon4H+41TMm94C0so6LCwspUmyqNK8RSs9y7yLsUlaDH/jXlcXq0+Txx3OhzeX67Mse
         X8TbBnU0lfDH+GC+/qzc9PxPDe+mGHB+q1baIqUogrduuZl1gwqi7NixRZyPHc/G0EvF
         q7WCc+XvTSLa3jSF3gcztrmgJQ8Id7PuLkrx/pUmD4nbWV6A/l/AJsTXmpm0wX9JuP7V
         0uy0NBQSR/K33DT3rwvIZKaPeH3mhmafIfslFFhl/z6MnrgufuxW/39jAwxcozHP6ANk
         eTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774632443; x=1775237243;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y6OTb3CPc2xv3jHEWqe425hW++ZxF7VSN1yizPSIBQQ=;
        b=dIrreWel3nhPWsvBCHil/8Z4Hvnjc7LvBWCsNrGl70w8XpV/6WPHx3Ry3yedY5m35W
         7SjK/b9TiGam49tMwzAlEL88KdLP2t5smWoAjPUoG/iURaImNlm1p/tpeI1L+eFAPQj7
         fA9HqxwU2IdVKhvToPiYYYCUyoOQ4H8U4SchaL4UPpxztjWGDXlIS6WzlPYXhUObS4be
         ZCU/ZO7eTiR45ihuU8fRP48WDQBYSGRfBJk8uUDGEiX1iTQdpE4APw3N7xNUPm80Eggo
         MNpV0/U3cVw9MhgatMqvxTA+pwoOG09p4d3YmyRt7HxB/7SayMrgsCAX8ymDldv/gQjT
         shcA==
X-Gm-Message-State: AOJu0Yz8Fplu4iPvyTeqaNPcQvDObtvnrfd4s73dmkBRhD8SBK5Dljdu
	t0p8xSQ4YDgwyFOpQIIEou235lPkvscPfCsq32MwbhNBlR0J9H//725j
X-Gm-Gg: ATEYQzwkrKteh4qLIrGVEnCe3PclEMW18Jhg2DYQWzgGkVE3OAx7PhgvObFl3Xh/suI
	SY+XCN/Vb68w9PruE+SOEPusyfWwfdryOs40POdAW3GvdIY4SuTEQKoS5PN+jUmpb9qF6nRqwYz
	kHVGFyuhxmatfIwqQCfwn5AFzoXQuGbwP7ImSms+/rFhy/DkhtWeUO58CdIogWCFxXzc6dxOmEO
	gYYo1ooNnIndT1l5xlrzzdA8S0gqPDzUcwWG1ZPcxu49p0mHmsYMTVXSMZYYtqZe6K9n/3tqIFO
	6A/dPxmVEKwCx5ej9TzeCrWtzFjDDGvVXpGUaufbez/le47KMVkGEgkeLQsPJhWGxEYYl9rcITF
	rrEAeeGzRRW5LQMTLtInDWtf1Aeq/2tPh4t5CNu7zkTZlOUACK2dpl4vcNQvsupJTN19MlO3xGI
	8xcCldnJq+my6MGWJibXHeHxe5qruL9SWnO8GiCluIhb/a1DTesYdT+d/5A8W9h93tue2hvxdg4
	efriTXmKM5BLlo17q+leLKahagbrrrk
X-Received: by 2002:a05:690c:110:b0:79a:81da:9198 with SMTP id 00721157ae682-79bd0302aaamr54594757b3.33.1774632442849;
        Fri, 27 Mar 2026 10:27:22 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79b1e45254bsm31195317b3.48.2026.03.27.10.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:27:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 12:27:18 -0500
Message-Id: <DHDQP3G0KWHO.GS2EWGCXG4SW@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] staging: rtl8723bs: fix spelling in comment
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Haoyu Lu" <hechushiguitu666@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260327111455.3260-1-hechushiguitu666@gmail.com>
In-Reply-To: <20260327111455.3260-1-hechushiguitu666@gmail.com>

On Fri Mar 27, 2026 at 6:14 AM CDT, Haoyu Lu wrote:
> Change "co-existance" to "co-existence" in comment.
>
> Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
