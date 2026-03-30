Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE7237D121
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 06:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774853031; cv=none; b=LTf51vUTX1J1eHOWxSbjuJ17WaIBJgeosKBJbrW8iNZlkgJJmPuCyQY3GkmSlTSbAC93O1+G6/LJgcAlcGaFmVyLFvVT4c7QcNwYpvv+DZfYR1sC88Q1UFNEQi63qxzE7t/zEr81LK4/H6uBRJXTpuPv9fj4NrbJ3GAR77Ejr+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774853031; c=relaxed/simple;
	bh=bIGQ8NVQ8eeLZButpRQ7YBM76zdLwTXPWiT/ikcJvc8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject; b=dfJhwM6NhvjBt4vv1xYDTYG77mp6x8iHi8H8wTB271LKnd1LvuyQa1QzhDi09xjH4uU4xuCV2O5fkxJ0ocNO6UH6XHIZ2t84WZeM0JK/vD/SLt3EiQ2LsdLM8hgbNyc61k7Agi5rn6m2bzsfciHXxZoFaEG9CffPoslTz6J6L6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWkd9ja/; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWkd9ja/"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-650158138d9so1367149d50.3
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 23:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774853029; x=1775457829; darn=lists.linux.dev;
        h=subject:to:from:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bIGQ8NVQ8eeLZButpRQ7YBM76zdLwTXPWiT/ikcJvc8=;
        b=rWkd9ja/76dWNkfd7xAYxpCCtZQGhHSYoeQhd7xLmX9qkhsDRDub9793YgrNCgPDgR
         CRRP3D/mSouHSdPScLI7z6RXue6DutwyMQFwvf9UhpDRyVk/FrcszkXdUTqHLD3Onw3D
         ONJiF5G8S0aSOzjqu9YtVUhDCd7d6WDyKCYBYlTRikgnEbpRmzaYmmFcDeD7V0aQklIj
         CaKtEssUfGq0sWXYmxFUNRW/mk0thUqjiuT2eyPuw5g0u41DpFO4IuxEtXXA2sEJPPlp
         ucgttoUGCRD8I+DrQ0r44nuCPvajPugYca8H66kFLZCv5ZiAW/9qWT7J5BLs4F3gccTq
         Mm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774853029; x=1775457829;
        h=subject:to:from:message-id:date:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIGQ8NVQ8eeLZButpRQ7YBM76zdLwTXPWiT/ikcJvc8=;
        b=k29Btu1PNGZvCvDxIyYuclYXtSWsBJ5O+gGXzTHrB9AiilSP9l/AWoVLCN+AJZcver
         01+LDqCQ98gzrBkPEj8bhmTuSQZhKyyZBXaYuBYh7iXEeBD5HfEZr49s4ePJPctzt+Mj
         5a+X6AsZzyxC0/SLWnnjKTrE6KYicOyjKIuHy2piKKP3v8aVRQD3/ibobnhDXw3gCPii
         GmZNbzvA4EYKBJzAQqKZuOgbrw2zvKxQt0NDSuPcc7Foq0MPHMaQ0GuleoF92NfZ36Y8
         GF7HeK5BCdT5c/0Y3FXh8HOrNLOCiPxuEL0xQ5s5OCoNyWqN4eflfD5ezqdUJDEHriAw
         p6Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVEaawN5EpTvIBlx0LCD8dOMC04n4NN9SE5Xx91XTlz2iC5QCOGpSq9hAsDzCT/NjjiX4qh1MBAaOUCvaZe@lists.linux.dev
X-Gm-Message-State: AOJu0YzzoX1umw3sg6AjLF0gaGQmTmwasPNUv/lwmqZRCxJ6VNfwWIuJ
	IJ8Crfr4LQ9MELiiwl/alh4OwE8HEbo73eLERD9kjfH0YxWYdgrwTODx5S4E390H
X-Gm-Gg: ATEYQzzWdClwEJs9jGzMvnJQzvmsSeVAVkKeglY8P0R8wu1LGzA55DrXiNQj2FQZ5oR
	6KZyi+woI9E5JeUWHggM1MAdmPyrRaRycAl8lW18qNb/y7DsMJXNqY77sxkkxqZp4PcJw4WWFZz
	LYZJEA6DYCDAAk5mFsA+CwH6Dbt6jeGG+VDoOXCZvhH0CNSasGZN9Pdp480+dRIyajTeHKvhn8b
	gy2Mqcnwb/kfIft6LQH5ND6N4cTRZ9/Xgj7hKivb9319D5BIf5lqg6cgtnNuT4JFfyRR1xePoxG
	EtyA5jKVWUyUc2OlCxmrW1F8WK/5t9LRQ2oDoPcIEDKSZ9QjMnaI70ad/qu+GNwHHiuSoPkAgRd
	9w717MGTHAFZO91av75Eh8zG60RDMsjPnZWlhJa3wtFJ1oS1nMVXoXsNgBYTk2OLC3JjUhX+PBk
	fz60TREG+8H8A70QEFnrVVjgLXar0lTS4EKxtkpnqkKfgeKMUl3ImPpErm+TpkVRzz0K5aRkEjF
	Iqdk5juuvARrdwsBqCEh5J1G3Ei9MLdmqZZ1Boz0fifOGY6ZGfLByGkkg42S5CNp4hIhHd6PfeZ
	KQ==
X-Received: by 2002:a05:690e:400f:b0:650:19e5:880 with SMTP id 956f58d0204a3-65019e50e6bmr3066589d50.46.1774853029176;
        Sun, 29 Mar 2026 23:43:49 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360:885c:d8ad:53d1:ffe8])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65009345aefsm3525993d50.15.2026.03.29.23.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 23:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 01:43:48 -0500
Message-Id: <DHFWW14E4F08.WVUW4ELG1CZC@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <gregkh@linuxfoundation.org>, <error27@gmail.com>,
 <linux-staging@lists.linux.dev>
Subject: [GSoC 2026] Graduation of rtl8723bs from staging
X-Mailer: aerc 0.21.0

Hi Greg,

I'm proposing a cleanup of the driver rtl8723bs to remove the HAL
layers, dead code and to systematically fix style issues from within the
driver. I believe this would be a "Large" GSoC project.

This would be helpful to the maintainers/reviewers because lots of
traffic comes in fixing minor issues with this driver, so if this driver
cleaned up it definitely slow down the firehose of patches submitted.

If you approve of this proposal I get into much more detail in my actual
PDF. Excited to hear your thoughts.

Thanks,

ET
