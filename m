Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261BE3D811C
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 21:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775250904; cv=none; b=SMOWtpm+IHMGrx3CP1z+lyQUADnz03yYjg/GSLEzKCbiji8Wbn9pp+oT7UvDYCtftJcMoOdf13tk3ESvGF+h3jq3HXbkfcJ8aAIHKgojcPixPyB01MYZU9jqfnvO7XdMkdafrcpcbJX2Z532YLI0y1WodhqfSNVps1DDO0iv2CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775250904; c=relaxed/simple;
	bh=cp4+lNCG40Q83vHrb6TKkHJYqcCwz9uq6rZJMnO5yqk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZErqM08i77rTKS5Antj7ZCXVuOhSuQ9HtZOcTwKWNVBxmL3zYMqGBqzx9SEC1WxTMrWBtDOsDpu4HF+Tc67Fj1Lrq3RgtIUlPAK/3p9yjeJrmuejFoP/B3twcdjIHnCFxUL6SfF4ET1C83jXF7Tn4G04+MrkaIfaSgdaimznxgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5/o8UAW; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5/o8UAW"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79ee5037d44so30477957b3.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 14:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775250902; x=1775855702; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp4+lNCG40Q83vHrb6TKkHJYqcCwz9uq6rZJMnO5yqk=;
        b=m5/o8UAWTArtLH3eY7AjgKFK02wrhaLfCCdpL/UEQqsSkjmHvBONXhD1GaN4UPymPW
         bAqnWttfgYBWnzHIvdnHOQ3nQIMIEEXvrYxQ2lNO2caDKUwbTKSPfJyP4cU7Y2ttVf1Z
         KibeB39enfdUHnEsxfkgnWDUbpSCg0ByG+xedF7fyxB3JWYmthA5p1xezT+hgxB/NfWB
         7+zC4JDPqyPAVWCM8fFFXTSn7zPMNrCyNC7HHTyj1j5V2ML2IWX6hGAclrp+3kF6CLH+
         RJACw29pOk3xjcDAQVAnchy9q71wR6CdPuA1QDwc4h1AWcX0s+8uLdvZLh3bkaiMzdBD
         DbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775250902; x=1775855702;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cp4+lNCG40Q83vHrb6TKkHJYqcCwz9uq6rZJMnO5yqk=;
        b=iE/XQSmu8W0jvu+nZAT/x6/dDy8jXEnZ1l2DWfhEr7UMZ6ZeexF/DpbJK9JTuHPl02
         MsNcTzRjfLO/plRsbkqcByVZkCG2F/dQcLEk8Gbya6PSgL1q0C69Kt8ifsLhLIhdq4I4
         awxi+hhEXQxWkHbyyRmibCQdSOo/JDtSIdxDXCyn2iWj+507MqG7/OyiPPXNg0QWCXM5
         02vu1yghAiTdFJszHCOH+76o0SH62I+bBAO91wpDFcVGHL09NBfSNzqf6sD649fWEznT
         hZ5fao6QkXup8Atail/1p5271lKU6r11hhsz2I3AEkrAVG9mn/ENBp9BvjrtiyO1BZar
         S5yw==
X-Forwarded-Encrypted: i=1; AJvYcCXhBKASZx3COUrR7/eUrJwqxcRNgRcyu0p68aOq40lvaSKKNpOhVitzi8EfdLqOdftiBs6qLpcr3QZNOpZE@lists.linux.dev
X-Gm-Message-State: AOJu0YwWKg1whecVh35OpJX4dbhUY4Vo0isEIidUquptGomyaPqXHkKP
	3qbh6xdrhkHH9u+KYbSmhf28oiDxQTKdC84eJPFGzATfcrxrOsy08MwY
X-Gm-Gg: AeBDiesQZmmp4ssnnyhNpt1FWOFPtN6gumm5dlwsAlTmWsGkWDWZqqPtc+c9MXaQKW6
	LQFD6i3xSLE7/d9kp7wI/Q+2ucYBCGEtguV0iEkuA9A5H7z7xRGiQSn/lm3yonppKhfJF+DUFZf
	iw4gy3hm1Q5ZnhENcnC8cKmTVah4sHV0vKjS/gDMOAQ1ElBvEXp1nM7hMEZtWtja8n4DLGGIYb0
	0fyb5Ka96jLta2TVKzDE99FjDDiYtN8nHysjrY/H6NGYO+UZm+wsUM0j9Mp5tjWUz4qFGGoRjSW
	8a/l9fI43B/EnV7YoQxCOzo7w4uhl+zjiJvv1InCfc4Xei6vaiUovyZHPXJq5fYYsG/HGVJFhpO
	cVE+Ezo5DXOXRxnu8wComUBSNBvyiu/FLlsqDeqr68jyS0y8i3F/bXxuNStOQsJfXoSRBtMrktn
	eotoPosd1Crb2HbO6T/bxWPBDkmuy8TYJL7L71oPIHIk1P7VVL5NI1BzBitvtrpjht7ZwQkME3D
	Hj6kgATF6h5mH+QiDM92XPSXXJvndz1
X-Received: by 2002:a05:690c:6b12:b0:7a1:e6b6:5988 with SMTP id 00721157ae682-7a4df30c4damr35699397b3.10.1775250901995;
        Fri, 03 Apr 2026 14:15:01 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e8329dbsm25849187b3.15.2026.04.03.14.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 14:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 16:14:59 -0500
Message-Id: <DHJTX8FJAMU0.105UYTG031HP0@gmail.com>
Cc: <gregkh@linuxfoundation.org>, <dan.carpenter@linaro.org>,
 <ethantidmore06@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove redundant & parentheses
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Sam Daly" <sam@samdaly.ie>, <greg@kroah.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403172839.367663-1-sam@samdaly.ie>
In-Reply-To: <20260403172839.367663-1-sam@samdaly.ie>

On Fri Apr 3, 2026 at 12:28 PM CDT, Sam Daly wrote:
> Remove redundant parentheses around the '&' operator to comply with
> kernel style guidelines, as reported by checkpatch:
> CHECK: Unnecessary parentheses around adapter->securitypriv
>
> Signed-off-by: Sam Daly <sam@samdaly.ie>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
