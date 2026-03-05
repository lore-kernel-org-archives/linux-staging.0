Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809D61B4F09
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 22:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772749048; cv=none; b=BptjCdsWuhf87ZLq63bA+nnk0DrCnUdCu4HTfIC13gAUyAExOuLPhPhQ9jG6iE43U65aikHFpxUwrARp93Q3Xj1V6OuwI5BbJdNctUZQ7E0YEyKMewgiiKnGtd4oLMLPHbPJCgpDA2dQ5vffxd+DV7Yb0/5msw04x4yBRn/cgUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772749048; c=relaxed/simple;
	bh=kAwq+jeC5uedTvCzuz4YS+EjzEk4WqeLHZf95q1yEsM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TBuYkSjea2i3SZtCS01DkgWpYnw0FgGGYRa26zMqBtwpSX7MyUH0qNYP9m1MRVuSsoeZYC8BYH/sCrMmUcghJGHE0ICLe6BfqkYi340oa1TcClfqizLIoAtF0av1RqrrmqIjyUfo5k6iV4k0wn4onlM1ZOQsmR4SZeTfrxQVnm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXyuyVqt; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXyuyVqt"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79801df3e42so111168757b3.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 14:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772749046; x=1773353846; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAwq+jeC5uedTvCzuz4YS+EjzEk4WqeLHZf95q1yEsM=;
        b=IXyuyVqtVzeQNYSmha/RG4U94j/89dklPU8pWWK+2mJ4rJD0O0ZzhvSfi9/OPbugDj
         tQY7aTeibEhkwJvzaXRQgSUMqHfotwg3co0JScIy4zlSYD9zNXs13VxE7kYwrndh1Y/9
         yZ7/PP1IJ/trAq3jqdOqNL5dK5GuG28LzjEkpSLBEx4r+fG1Ex5W/6zS6h/63UBgkobm
         9crIHwbouemSlWeMIbLo2IBJ+XtD08sJtwNGICiQDPz7lVEoiIau7FZ5sJPWa/4blNoN
         N8IYRE93WHgzibbMObld/jC8FAIRh9jBCIRG1tVi8wH8x/yhyZ1dG0/AG6q9w7VhjkIo
         +/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749046; x=1773353846;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kAwq+jeC5uedTvCzuz4YS+EjzEk4WqeLHZf95q1yEsM=;
        b=xKmTRXa0tYTOKuPV0rCZ0aC4DlcEttu/rBqbxwJusGTqY31tVP2dw+ho4UBu5uiM0S
         8crow6T3l0r58KMK0bBODFLQAjjaefSlT0rS5zDugBxTaLSHT17u2qAqMJX/rhb1jwQC
         YqJZv/hOwU6eB7uHtm+7TtXuPLoCtpTXxb/jBkAf+QwEjz5bVcgJ6j7t5keDiZPOvxG6
         XovWvsN4mjCUp/aVHTu7J8VhvV69dWg2phtQrns+NWycts9yAnTZ1bQAvBcPeLH0dgWs
         2lgZRrVhxSgt5TNPB2DaCXVnxnVAXuaX0LLOsv9sYCAvJSaWqDCpaPzujUK8JVZx+9/b
         46zg==
X-Gm-Message-State: AOJu0YwxMufotMnrYPQ+W7xC5mIH3XMhcRKi14XfeSSKG35et8DMMCWv
	CYWdqr5nWXC3yV17jWxO+FhXXhgo6Y+VXhjdqQigdk07JZMChUQfJA73
X-Gm-Gg: ATEYQzzgNqP3R/z+zfDz9ZhPBN/FGClvMpfcmZ2AsJIgabXRfTwOnTumGMwHJB/tG/X
	wg3PIpo1Xyy5v7ofstVA5U9N4JHbZOdSPE6AJasV1+P9I75W2dTuTMcWISBd6ddBTYbd7vFYuRI
	FNdxyUXp0bR9ERysPER0pu5UTDV6DOQ8t/m7o1VJ4NcVvVSlz2E41cO+QpOUCXW9zt7rbpRM1KN
	rVTkrazoXKnQoRzakNT76UL3U6bJD8ggePFFSlf3PxrMktG8L7j6LhVZbLjJE8XYAeGdgVzmmkF
	MOnNtsOHkDKarEbRVo0e64Qjctvs0GCDkX5siN4OFsO/yGSyr6U4g7dJit9E5QdiFwwR+yMYvML
	UdKtbp/BKlBgzmQ0ur5JGKbikdIALk6M7QUaqZypB3SrS/3Pd8/Fe0AP5Dqqu4a5h74xv0Rmpf5
	/85WyLVsbXFPaiCsIYkLrITnIg1M+1TsZU/H3ivH1m0JJt5WHtksTsDGlvBG5ZTl6/5ByL341dH
	HI02vReouG0TAEwICvpoNlLvW7mq6AH
X-Received: by 2002:a05:690c:e371:b0:798:c42a:137d with SMTP id 00721157ae682-798d1e6e47amr31795117b3.32.1772749046526;
        Thu, 05 Mar 2026 14:17:26 -0800 (PST)
Received: from localhost ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a92c47sm94502347b3.3.2026.03.05.14.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 14:17:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 16:17:06 -0600
Message-Id: <DGV7303N6KD4.1JF4X4ET6KJXQ@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses in
 rtw_pwrctrl.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Giorgi Tchankvetadze" <giorgitchankvetadze1997@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260303124306.260483-2-giorgitchankvetadze1997@gmail.com>
In-Reply-To: <20260303124306.260483-2-giorgitchankvetadze1997@gmail.com>

On Tue Mar 3, 2026 at 6:43 AM CST, Giorgi Tchankvetadze wrote:
> Remove unnecessary parentheses around address-of expressions
> (e.g. &(adapter->mlmepriv)) to address checkpatch warnings.
>
> No functional changes.
>
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
