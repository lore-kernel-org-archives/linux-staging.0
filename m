Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3536B35E55D
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 22:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772748501; cv=none; b=kEZtxxT4FXchFfuldFiBpyX9qzEz0kfJnEWmgD8ILVAlFbbGzO6Hj/h369Cpg1PsKccPzc/Qq2UJlVWohv5AehDAR7Kj1mw+QhIbLlW/41+2+ec/gQyzrYjit4fipNTHGJGG6etd8qOTAXGbmYnM+kZWjsGFJgWbaN6nN67cEbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772748501; c=relaxed/simple;
	bh=atRLAFlzmuGK+2X9o+kf8z760y/2Saog93NnWO35okI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MHj/nLp2W7LJEubdnaw0U9Hvfr1SZlhTHCAvU+3ZDAty50Nb1DmfZ1/YLAcBv8zEzgmJgaAu+u12VJlsmyneXsWBzc6YM7YGc+p7tyQ8poUnm7MElgKkYKxjnFY+6Rn9QAasbYbH8eD2ElH/FfDIOy9w3hDklV9FntRRA9ex7nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJk4IuIy; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJk4IuIy"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79827d28fc4so79993807b3.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 14:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772748499; x=1773353299; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atRLAFlzmuGK+2X9o+kf8z760y/2Saog93NnWO35okI=;
        b=nJk4IuIyZL4aF5BHj05fOzFtN+z3Eu1J1qlNV1Dr956RfzOrlHFhuXJ1/A7tm8qe35
         TTjm7XeGVVcmJkMxGYk2IxjsM2fl56QeidTqeMe+iJZI45LYz4tqXPZiP6Xa5ItXGyB5
         BAdlQW2GTgDB7wTchAJrud2u3Qc7QIk6H5HUm293VShvUnjYXVJg9W2avDZzRCyqlnvD
         GUzUd0gK//RPP76RyhSrBXQlFK081cU+aHrpCJYrGleInfGMuaYjPb9a6jxlt/akuX2D
         5uNeLlbmgT+LuydX+JIpD9vlBRI9Xdzm0LKeS9uMZzvlsRqgge9Ihw8jeS/VKjPnAPjs
         W6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772748499; x=1773353299;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atRLAFlzmuGK+2X9o+kf8z760y/2Saog93NnWO35okI=;
        b=BYnQUirqftCM47ky6kCDv+cPoZ0DX2HKF8ylvCogFtmIpn6Ic5iFszvOUXvlpUojy3
         3+YeDOwKgR1MKui0WWIF7nwNOSWChhkxIWKRZEL8x+pe02OJ7HTds89PJWF3oXd4eHaE
         OzfweShOCSF/SV6iWuS6pnpYHH1H2nlhmfUS7SCu6IaAGYt+IsWj6uGKa2PTocZw57PT
         GuuGyUXwbbsvcQ+KWKcHTFz2flAQyBXsx1BCIBwo1XyaNgBrf7K2BZYv51o6DAJRX6MZ
         Ihv1LvIUvIU+FW8zw0mKliPuycaNn4fBTiwrZjAe8xsrPUMJkiUxeasCpf9jkVdARf7f
         LFMg==
X-Gm-Message-State: AOJu0Yyb4Ah9fUYf+H1xfrDpEzZKJ+rPKUmmYulcwPcrSiqjaLvCIQML
	ITiug0JLu/62KnUe7SLOUQQIYw0cWSyIrPhdy/H6t+v/nnhzVxUvHmJC
X-Gm-Gg: ATEYQzxXMu846+eI7pCold/w9VS9jxug2QHsN8eij3rJBiujDAI/XUybdmX58e69W+K
	lwPuMYH2NVntmSC7pfHYGlQUCir22Djx5sHZ6/QSeZW9li4hHIXahy+VwNUQJ01pwIdMGenuAqI
	fgj9Hd92BCocKveQVE1cr/nPa+Pmt2SOb0WNf7Su13i43/Ouuclyrv4+DfY6aB06UK5XVDJjETt
	s8AHUcLtmqmuoKhD+tXA0RsLqwuLAdUPx6/mv7EUu5kF8zVJ22Bo19stk62aYCdi4h6vzykSHe1
	skVpFTe8tDu5Bdfee5fC9rtr+GUdlW73SnpQB1FybXfrlYPwbQEl7JaUFlcD6nm7IoXe5JzH7G6
	d5Bt6bfHccy/EmZ/kGxMyhHg0y3Q9HrSFSs/FAF0cpNwyp/T3xL9nc20/kJW4K5k1rEKuhL4KCF
	Lpav8Y2DTeUv07BBQDTnoMz8W0nsQZh/JkmhZbegCkoSJDBbx3LGkU6CGegwyhsJ/l4DRigPxbG
	b5IgrGLDQxV0wLdxN031D9DITbGtTvJIgp3YxLPDV+k5qs3ZmqnBnU8qPCkJH2z92yutrsIFZqc
	aDjvEZw=
X-Received: by 2002:a05:690c:c4f1:b0:798:56eb:f238 with SMTP id 00721157ae682-798c6cc63d4mr61100597b3.36.1772748499187;
        Thu, 05 Mar 2026 14:08:19 -0800 (PST)
Received: from localhost (c-68-35-58-232.hsd1.al.comcast.net. [68.35.58.232])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876af20ebsm92719507b3.22.2026.03.05.14.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 14:08:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 16:07:58 -0600
Message-Id: <DGV6W0CRMH5A.29KJTMW3NQY0F@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] staging: rtl8723bs: replace msleep(10) with
 usleep_range()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Yash Mehla" <yashmehla688@gmail.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260303084541.29279-1-yashmehla688@gmail.com>
In-Reply-To: <20260303084541.29279-1-yashmehla688@gmail.com>

On Tue Mar 3, 2026 at 2:45 AM CST, Yash Mehla wrote:
> msleep() should not be used for delays shorter than 20 ms.
> Replace msleep(10) with usleep_range(10000, 20000) and add
> <linux/delay.h> for the declaration.
>
> Signed-off-by: Yash Mehla <yashmehla688@gmail.com>
> ---

This has already came up before and Greg decided to drop it. [1]

Thanks,

ET

[1] https://lore.kernel.org/linux-staging/20260214173139.49094-1-ofekalm100=
@gmail.com/
