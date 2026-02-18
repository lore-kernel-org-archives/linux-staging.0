Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460721A9FA7
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 04:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771390323; cv=none; b=CtnSAFkecuFX5CVS9h+xKgD6EKW555bxz+HHgBGIbNkTbrej20i2iXmeqrDdQZven6QYU+74T/9ts8IrTj8vpNjVory69/84/dQ6DFPMsxthW+8EaHU94vHiBAI2lUuLQ9lw6DJ948Gqq1PN+AzmWhw16flujJK3lXPWQIemvWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771390323; c=relaxed/simple;
	bh=ZPtauDFfZp4rx/km57dfXJXhZg+hsI5EiulbdfEWibw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=l+97lyovy2Iu4uhGIr1kyxO5z3FJb85w1u2mAL2eEnnjlByPLK8VuXZzb4jSJ8jxhzRFFBTe9cY6TXZmwxcOL0TCrvMotjyOlg6ONx5Vd9/fYi2GdgRAtSLXUjK17zLgQ6o6L9lYkgfCEhIZaWgiZ2xKm004ITZvXn6uPwgMr4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGSL87zI; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGSL87zI"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-797de0727a4so17394957b3.0
        for <linux-staging@lists.linux.dev>; Tue, 17 Feb 2026 20:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771390321; x=1771995121; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPtauDFfZp4rx/km57dfXJXhZg+hsI5EiulbdfEWibw=;
        b=OGSL87zIpi8NijcFwy2TvxmpslI+vI625yl0Vv/lix/FhIrX7BHyEX2zwHPtNt4r+m
         YQyTzXT4+syvhe1n24E2zygZprM+7m8AvDremtaA0BNPykCYNwojHsDPwhh3CtzYvaBq
         77eP320M0W5ytbNlc3/oP/0jRTLj8/wPt0hS3wIr/SCKIGiarRCHGV236wei8C48jJsA
         VqNpvwfCE3yoIY5nJYijvW2o2vQw345Vf2i25cpWIHiAhz09uHsqhLJn7rq1tlq19epo
         0DjopzQaki/q5SK2noKDmtAocF7CrIoApXhqBfDzDruA+HBDENIu7g6I865NVKfHTCgF
         PzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771390321; x=1771995121;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPtauDFfZp4rx/km57dfXJXhZg+hsI5EiulbdfEWibw=;
        b=AtBgeI3Zi8hooBQbWQfjbovrz86L5yW2fHP1Z65WXtGZI8a+iqz4PU7un30JIj2WGO
         +9mBXUZEDh+zblzXcostkvXLRS4l7sMJEwPK5TbHxFK36f2cikz+qkccCxmjSVixz5KT
         7fnLHOiih5VVBsRaHUiowNA0sAYIm3vmYDh14uz3FpdU4GzG+gv+X514I4+6KqCkPr5G
         ZVId0We6usf29zMc3kUFjtoJU9zRAMJ0nA83Q2lOrgfvfr1i5yqJmCyBjI2jkSf2J2qh
         br/dvqB07DFW2fFpsE+CXVY3qm5cXPUg8qCksiTXj4wp7hty5RqRfb186WKSWBQ8VB8M
         iaAw==
X-Gm-Message-State: AOJu0Yy2ngvi+7ER8Rj2x1EvU2P/Ze50ti08kVODotOVqTEDw/el09/u
	zpAM5tJSAXmFv0zveWieFMzj1BRQ/ZO0oSLuzy5ikdK/Tlcr1XtOLKBh
X-Gm-Gg: AZuq6aIv6bpw4BB0oGHJEglhzvfeveRfU2I98fYvGzFeuGdPNHw+albewH092u41TqF
	7hqM8j0/YTcGzJJeIjUXKJAOuR6iUdhkgDwVxqadesiDYustPCS+IgLkNIOGmHlHE/aLHnTr/KT
	uXgfnHt9klTBml0t1rCbz2hWQgdYmQ3MHaV8fIB2v35DaAikZJengpMuuw7ZigdYDFkap5is2nc
	RD+IAIaC8ZS4C6MKOo9EMxLj/8jUqkAYkudTvJUQkf8pnIHUP32+7L2J7EpDKmbzOTyydAbfd01
	CvBK7oeqWCVpHocgqiCDE4ru9lXT6409SJNEGYe5HD6ODzhu57EmktjJME7N9l/c5beulsGPzfH
	PcdlyT1V5h2nCdroGZzhLKGQt0vMrwRoPXow3+DNtohrysescJJoVrNZAww0Tygpa5QhBdYBUV+
	xV/vgsp1O7yYS/HcMTHL1Bb+HsFDNm1oI2bMCarjvJ3khiDWicCsXsD0IX/HOcH56rwGm1wGK3T
	Le0GZP+llb2JJ2I5rK1G/orcqfVZzeN8U/2Cbgh5D9KgHVRg60=
X-Received: by 2002:a05:690c:4c01:b0:78f:bc2b:83f5 with SMTP id 00721157ae682-797f71d5a1fmr7208367b3.20.1771390321177;
        Tue, 17 Feb 2026 20:52:01 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c18c22esm117477997b3.15.2026.02.17.20.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 20:52:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 22:51:43 -0600
Message-Id: <DGHTGF91VQ7C.1NL7GVJK2JJ1@gmail.com>
Cc: <linux-staging@lists.linux.dev>
Subject: Re: [PATCH v4 1/2] staging: rtl8723bs: Rename camel case
 enumeration
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Bryant Boatright" <bryant.boatright@proton.me>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260217145352.2172407-1-bryant.boatright@proton.me>
 <20260217145352.2172407-2-bryant.boatright@proton.me>
In-Reply-To: <20260217145352.2172407-2-bryant.boatright@proton.me>

On Tue Feb 17, 2026 at 8:54 AM CST, Bryant Boatright wrote:
> Rename camel case enumeration to snake case and expand enumeration name
> for clarity. Update indentation of function prototype/definition based
> on new name length. Move enumeration definition from single line to
> multi-line definition.
>
> Reported by checkpatch:
>
> CHECK: Avoid CamelCase: <ParseRes>
> CHECK: Avoid CamelCase: <ParseFailed>
> CHECK: Avoid CamelCase: <ParseUnknown>
> CHECK: Avoid CamelCase: <ParseOK>
>
> Signed-off-by: Bryant Boatright <bryant.boatright@proton.me>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
