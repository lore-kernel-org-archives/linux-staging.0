Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B14C81724
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 01:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773537736; cv=none; b=ce+VDUKgbPz5zGiLaGU042KGgToO7sBGsVmvQBwoTALhPbbK7Fb2p70RQAmYHR9Zr+KgKdFqZ2a5I37k22fHhleGwDHIhNIjwfiHubzMZkoG86B5I14E8E5PU/oyvpwanqiLCjXHXf6VdvNR3T0lcYY9E1nU1vKa0YVele6+EuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773537736; c=relaxed/simple;
	bh=XWpt9NdVvbz+17FMk1+gh/ZpUzdZMNoGpw+LXPMZ/8c=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=JFr4Ud+bgZpqcfzY+HJlO1tlaOQD4DAqnz1M2/e21dZtrohBA6teWy3Rol84FFFfz7Wkk0C3XV079vQrUU1zKbsi6fu/tubIMf+n2EBoMdqBQs3r9KBs3j7unhP3yVWjTsUnBGNqZxzBZU7v1ix/14LVAFcd0OYMqtMPP6lIBtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aE/zqcx3; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aE/zqcx3"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ca09f2056so2591124d50.2
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 18:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773537734; x=1774142534; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWpt9NdVvbz+17FMk1+gh/ZpUzdZMNoGpw+LXPMZ/8c=;
        b=aE/zqcx3w4iWvHNj7mGZvScU17LMQsiV9lxvvDyI7XSQNlJE8O2i4rEYuAi/ZvAQPI
         HEcOQNdcsx+sq+u7rCH6Ug85+O0996NVPcN9nvnXjwPBsfqn7NdimSwuz5QXpggJtn6C
         Pz8yTNH5jZncpyccX2u50F0Pz8HWAPiEdiPUn0EOKUqSE1HcsZhnT2W1Te4bF+kUOTZw
         HGDBaHFMW+8X1X8p7lx/nq/Zc9+jXPjxCMoZ/rnlk4Y8T6skwWYNQktKZRYgqe7Nw5+n
         kCBhsuLjnXo4DZxp7pm6ZoZolJud0buK/79W5i55BWqOgz8pFFl+8S2PiPtrHJet5Q4R
         e55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773537734; x=1774142534;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XWpt9NdVvbz+17FMk1+gh/ZpUzdZMNoGpw+LXPMZ/8c=;
        b=VJ+9YWFm11Swja7+Ff0c/a6UZAhB8khZx0SaZgBBxQ12/yYFoscRW3e9Rn1jd0sRLh
         Z754V0QuFwHjXC1jdSdVdTPLFdKgbSTOFqRxqiFwWPKbJSeWLE51eGEpjNduuJzpY04v
         9OGnnbNjXs5fUMfEP7+Ztr6HGwXI5y1GpXbMLUpbCyuzEbnMrPcuXNTjkaYINBCLlzaZ
         3rVbQ2/0TKyCHAs+z0bMG4Tcm8q7q1CMnK1jv8W2VvbVUnOG7oKjAO+6Rs60ElDgx6Oc
         D6SnVQi9tyrzbOtcm6qCr+BNTdZFtv0MW6IxUGWHSt4X06TblZuUKxqwdlFVYznz4/C+
         rVWg==
X-Gm-Message-State: AOJu0YxCURZgFIqaU5WSMzU6EYcrV3FfxeKF1166suErtdKciEjHMKFX
	qMYNzXSaUc3S+lzNHktQyyhewTWmu100j0V8/eHnp8vOH2im4yi9qjTBSJNWh2vO
X-Gm-Gg: ATEYQzztfh95QPA/Gs8Y8ciCADmo+NYyI+RwfoJcvVJDv8zb6ldP/ECOdH7aJgo7Lyg
	VEBplLDXf8ZhW6LJ/1jzhkgkmoF4xdJio76sVNYornFsgPuHQegYAqk6TJdyYfzTQsg1je1cDqI
	KSPe1yzuVRB880wAFDo1wPHssocl+PCRurKC6sq04DIzyse7msilQRz53aY8elBBjXnDjUzSE4L
	PpqpbGjYxnHBcrajK6LXlFmqcdXjE44OAfjNxQlRaCD8eolnLqT0LxKDV8oNBv5TbOh/XL0XlrZ
	lpN5pvEoTmtM3ytmyz1T6Q+mjzeZoVAYRhMgzNOZmCoy/16O3Cgk8083+7bAgWT0pIrY4NaM/Lo
	Xv96TveRAcloauPM1c8mQIkKI53gvesQ5Dd2T2a3BQzFhvXUV+HymSr3DMqE4ZUDR2jLpYT4WRA
	W+Y+uiU7p/Uxpa4BInbZAJfCbPVlXmWHcoEkt5J7DUJQN4UW69PDbGa4yn/k5H8yV7xz7hVyZiK
	Gu6xMxuF/N5qFqV8DUida7vLIQe7A0voVe5qY2xaF4LNUL9WGXhaTNa/o3mdY1QhGmgoFucVHRe
	T2Goy90=
X-Received: by 2002:a05:690e:204d:b0:64d:1a2c:1ade with SMTP id 956f58d0204a3-64e6306db98mr6839772d50.63.1773537734136;
        Sat, 14 Mar 2026 18:22:14 -0700 (PDT)
Received: from localhost (c-68-35-58-232.hsd1.al.comcast.net. [68.35.58.232])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65ba7b31sm3423592d50.20.2026.03.14.18.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 18:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 20:21:52 -0500
Message-Id: <DH2YNDGXXDFI.3BXM4NKRB366A@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Zile Xiong" <xiongzile99@gmail.com>, <gregkh@linuxfoundation.org>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: fix inconsistent indentation in HAL
 files
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260314202233.55662-1-xiongzile99@gmail.com>
In-Reply-To: <20260314202233.55662-1-xiongzile99@gmail.com>

On Sat Mar 14, 2026 at 3:22 PM CDT, Zile Xiong wrote:
> Fix inconsistent indentation in HalBtc8723b1Ant.c and
> HalPhyRf_8723B.c reported by static analysis.
>
> The indentation of several lines does not match the surrounding
> code block and makes the code harder to read. Adjust the spacing
> to align with the existing indentation style.
>
> No functional change intended.
>
> Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
> ---

This doesn't apply to staging-next.

Thanks,

ET
