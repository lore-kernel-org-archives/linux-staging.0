Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964EE2F3C22
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 05:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772517370; cv=none; b=qlqssyFXXBtM0ZQ0L/NrPD1jTzFsHZY8VfXqcbO/wIwNVRIr2HOTwFJlJP9CAAJQkWO36+GvdAZ4EJ3Ayans0p+H+UN7+guAESjEqMIdy8MaszkLtOgnYGzvqQD/LExnB2hu7F2PZGwlPAsrW8j3U6plw+OCJA5qWIMynXxtbgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772517370; c=relaxed/simple;
	bh=0+hgfD3YvJ3pblt22rFc/nZgTFnba3Q6xnVa+3h4TDU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=t1YBxqvEr2z05RW48NFUaoO1iRzo458iX7zW1PDpwoIMEIYCTNy7IdUKB0rwVLGSYJzKjFY2eL+/qvKW7zPULh2zUa/q+CPuaLu2gELXKN3CnDl443ieVB8q7AasCz2Qx+8XIpkypFx06aq9KpXkKfLRfh2+2WWBoE6074UhRnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX9mRPeX; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX9mRPeX"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79868cde1eeso56133467b3.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 21:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772517368; x=1773122168; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+hgfD3YvJ3pblt22rFc/nZgTFnba3Q6xnVa+3h4TDU=;
        b=bX9mRPeXWctVZJjeHTtMZLwJL4z7t6yMX5hnm/WRllr/iUvy/ebKr+gYDC/VqhtEQj
         c8f48jFdHaCZhwWzq4/DYT+Wt/NwLGJI09hwn3U2LwnPN5F9qieNMQ7DYgVFTtiEFm2P
         EVXEdWfJeG9FEQ5GRQvq96Kmw3AdiayCax5yftT5uYAdd6lJI1bi9+j2ioV8wP5yIUpO
         oKFjPUoYJystIxxF+iBQI4qZX4IGKvVYBZ/AYnoKM7xi8gfGZiUYb3po9gTde2x6dNmM
         sOdaQVfG/xAPqnvBa1eoYFbBLZRGSgkazzCOhGXqsDs/tw3vK6kcqsBRy7Uwf/4DLddC
         jlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772517368; x=1773122168;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+hgfD3YvJ3pblt22rFc/nZgTFnba3Q6xnVa+3h4TDU=;
        b=EJIqjkTLdkcgYAcVS008ZWbwhX7OEjzj/hosUN5Q6yDl5CEwRMR7gg11mwJKUpeSEU
         CGFynDCgN/89T6c2+XaMyf+ViUZDMaB6GGEqV3YKo2E4vFm2Ch0IWbnrdv71Y3y96uWH
         C7/WaY3OCSrZQzq6KmMLeBmlxQBBqN8wSKaLzle8kniGDAA5SlzeF8ooOBolUzVFhBGB
         xtOkSjTd8woN3E2Ix0bsT6KL88b674YonSjzwYtQqIw+8XWBovB9zAD1OrW/OEqIv7We
         dwrVW46JveTMblLZWtOuzHmWkR9cS8iPH+PAiUfLR68qOitnrSATbuow7Q2mkQ3pdL8s
         RODQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQGODvpwUJ/l/jEchdvs2B6CaZBjoH/FD1S36/oYIA/kuz/UehEHq/4zKEOYD3v0c0Mv7zIJDEoRgpbQGm@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr4QglmNMYWL5WA3c9Ytjmbnn/X7KaBgBcli5yW4xFNxCPRGJp
	aRlxhb0e4d1Ycd6wnVyH9tlXvBz64JY9AOwfykRXrlvBv1QbVtxZ2BEp
X-Gm-Gg: ATEYQzwrKANFIu0x2Jqth5L1kJWkaCfcDkrSPC6Q+YP2gSi21jFjyrgtnlkFYS3IxTg
	ao9AEzD+VS+rmQfBmMKhhvtGBEY3ovDXug62S9+y73j84zAqHimKZXZ6pMMLIFVNv2Wpd6lutrW
	5ORrrg2NDJxWazgkEBGqeq76b8vtmSVigOUa8vo3nx8/SxZXq5O6UPxV4jYcjjbcBF3zqfQlBV0
	d7v38I85yWw3H41FGgnnvngoLOZB44dUIalMgKdY4CB21iSzoOSq7WrHR69Pd6MsRwYupdLbCbJ
	Aq5XAsu6zSNIaLYsvMZgm42iDlrCvZiwhjRQn4aTxrkzwJg5MpH/NTOc4QjgfD5dCeSPNHv0vFo
	8uF7mXTMPo1cJwDyQLwGdxMlMiAuB0TED74CUVckoN74QEqTqzsvMHPOxYEPlbIYAz07ZkVp6nD
	vLuQeQ6z5Y968eZCJF6d2K6rzcp9y3hSSHoIET7kLPyNb1Jv/ktv6/e0gn3tWmpoAOwcyyrLy3E
	c98AIfh+DQ/YcjIurLxeJEcZYBDFARjuhiyzHGgr4I=
X-Received: by 2002:a05:690c:d91:b0:798:2cd4:5567 with SMTP id 00721157ae682-7988560871bmr131090467b3.56.1772517368533;
        Mon, 02 Mar 2026 21:56:08 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c3fe5asm59897327b3.35.2026.03.02.21.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 21:56:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 23:55:48 -0600
Message-Id: <DGSWYKMCBGO2.33J7GQBIYMEOG@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Hans de Goede"
 <hansg@kernel.org>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Andy Shevchenko" <andy@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] media: atomisp: Kill OP_std_modadd() macro
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302143040.2495464-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260302143040.2495464-1-andriy.shevchenko@linux.intel.com>

On Mon Mar 2, 2026 at 8:30 AM CST, Andy Shevchenko wrote:
> The OP_std_modadd() adds no value, kill it and update the users to
> perform the necessary operations themselves. No intended functional
> changes.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
