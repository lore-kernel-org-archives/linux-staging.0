Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641249;
	b=SK/hJ6Sz3pBhfYCXWRDCBwc1TlTbilV5GUJWqbKoTUMktqLSL1n0SXPvR1xwx1WeupRs
	 mqV0gR3MAwZZqL/AriC8T5+wH8HU3pE3fopIPJ4J7RLwyrVeMnFz8X2GAvxl0Td6Ae171
	 gnPHdn/VfXdfeHGttBrQUCUTzDt1VBYWrcDIyuXlgKByCe/DjHjx193kPU9KuyYMPs8RH
	 Jvl7E+gC8qpsR1z7jCyUu4Nc0ZHhoHrc33ROJyDwPr4wIdwM6G2uyin3hvrxn7YvfBKSQ
	 cMCTfdOiZ5IRmXNuc2HP/G6n4jpKZRa/ZTZ+WMn5jqkJqqGy7zIytNWu1gZXCMqYQAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HRL6vIGNzmBBlS3DC/VjwZ6m9MHEtJ+5vgV+r63OYc0=;
	b=t4q8Nd2yiCeFjWfrCpugCqEHokPRuv690CCN9BMtSdpQqkn9GD7THXqH0nnXtd6vOSgD
	 3Pb7hFl38AdC4Qfg8EdkbTv2rkcQLbp4BnJVWg1Q8vM5fFCvmVjqq5fYLULj9vw37vtQo
	 sfxbRxMehXlWnUCfU9EZBZ0Byl0LEw4AYITNpys8quH1E95qA0IG6UJtWLeY+bSHhPRzt
	 1ZIBs10EgBvMJHYt1F0TlOIdLEcZ+n6oAKrRl/G2mQgmsf5W+YuH1rf4RL6xsuo1MVeP8
	 ipfCXNcguAd4BPTB4mF5zNLH2Tt9gPz/LJn+sXoaf5bDN+IOUduhGhvIr3YEWrcjcFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CEqsdFW4;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B698606A32E
	for <linux-staging@lists.linux.dev>; Sat, 14 Nov 2026 07:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B698606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CEqsdFW4
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3417610eec.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 23:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794641247; x=1795246047; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HRL6vIGNzmBBlS3DC/VjwZ6m9MHEtJ+5vgV+r63OYc0=;
        b=CEqsdFW4EgzPdh7s0bmlmGbRQWdVP0fU8qUxntFwXgX6iG3qv4R1ZohAuxi51Ws+tB
         PLLLeQD1e9RaWgbLL2T+HLbtZ2/GgB47ErEG1Yk1NFspuar9dCOd8IwS3C+MSHTBN2kU
         3RFYmZy1eYJxPy8V6FMGi/QjJtIfG4duR6WWzExtU85zHIy2AGBASXX+v/jSUQUyfyto
         LBoyZCYRs/cIjOEGapf31ax+EUuwQpr7sVJNhA/zA/+wnDk9JqKKJrLbaafBCdjxXfm/
         Tuge6zl+NEeZV0PhotNjE/gEr8Qf5sqTzJuoRKnELOGkqw0FKQLCS9t2koHLVoHxWxWH
         fNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641247; x=1795246047;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRL6vIGNzmBBlS3DC/VjwZ6m9MHEtJ+5vgV+r63OYc0=;
        b=EbysTageVD5ahe4pwVGT7q0MBFr3bf/3o/jhroSoARXnf3a6StANRO4hyeAcb45g/l
         E4P1mfl2q0o2p3OwEBMrf1nP6prfNTtRWLfFeD7VBwKMrlSIAmfIo51s9q8np9422Ta5
         eRviPD0CnnPUYCu1zA4pC55n0YKqo7KJlDcLDGVALI3h7/O+o434Hgsx5s8Sqj2Z+PAL
         LxxnZsn4dblBxpl96QeDowPkrp42pcKnQbqbo8yvlz7TiK7W0MjxOIP0WOg8mM3nifCN
         n1j3Y7g6e70VbU7goDb/1kkLbsJOfDiH6nkCpy+g6kx1e+65wIfd5Qbbissb5z6wfJTh
         yq1A==
X-Forwarded-Encrypted: i=1; AL+hErHHUvU/rgm1t9lvwxt9tQgz8yDQmWgACcL4XGdjScghzp6LtYMTrKQ2K8YMxmMSvHlYLgVwmzlkA/TGEmJz@lists.linux.dev
X-Gm-Message-State: APuU4Z/mnkmv0tYfXW/Ka9nSXrVW18KOSdkRTgqqW6O2NOlAKFIHYkQj
	Mx92CK4GqnwhR8DfWBOGQiKyd1UQkHFEisoMXE+5REgz3C/dmh1WBiJi
X-Gm-Gg: AYBFou1uM/a/3nv1CkdcCJzexjnrQy0tFtZ6TVe7xvGS3h2VHFMK+EKW+8ZvQw2ZncC
	cREzs/6iIMK1p5Ar0TVqhDYAH298PaFSeDPpwZaovAwTzzL6Evw+kW/G5Oq3xFSFwMWUf8fpDry
	Oun/p+R90ndm/KizfGHGMM8pvNgztyPZGQ8Hmsc4GWexKypiwOdNJebqnc4ROKconyCQjnfpNRU
	3ngtwUUFFOVvv2E5NRNV+hygD0xhmU17avDchZTxZNgtehVESayykI8UeFKOnqkP6Jv8CaRRNam
	l8lxRwLIa1PJo8YJdiU3yOcJK4qINc4wVcmGKOmEtL5TAo/ZJdqhvKQDuZIDxj6G7z0/2ylqszt
	ZO7a+IOTGcYHFDobpRwaAZRZ0gERgSOEY07O3KBKx/tb5Xxb43vKhz7h5PN2+O8CeD4zy/Sg36h
	JSLlnXnmWfjPptqScnS0dhhuUTHVWyjYbZiG6JuNiA+h9tNrGqDNubcJCo94WtSy9Hvmi5i7Bky
	H2G90CJrV2LRsSPYBi8LrpjfM1NcGzT1+4/8B04811vkJ59TyIFJzh6qlHNJNrqaXSUOqfErcI6
	8b55KliftqB502W83gQtmJ4tW5RXRjF2E6DE5uzlw+Q+RGWa5Jn04VIugFwApNlz5yrrf2C++1g
	2pEzMoIS0175FA5QEapbaUgd7IJ2ThPRH0Vy8pUq6N1svQ9sW/fwMDl0Yobx5luL8DFDCIplcZd
	ba0ceuZiS3LcvgKRKbA1fzKbu/fPw9HKkrNcwOqYqGeA==
X-Received: by 2002:a05:7300:828e:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-37966a575camr4240798eec.28.1794641246996;
        Fri, 13 Nov 2026 23:27:26 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm25914706eec.20.2026.11.13.23.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:27:26 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Niloy Meharchandani <niloymeharchandani@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: frequency: ad9834: use devm_mutex_init()
Date: Sat, 14 Nov 2026 12:57:19 +0530
Message-ID: <20261114072719.21558-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114062021.142296-1-niloymeharchandani@gmail.com>
References: <20261114062021.142296-1-niloymeharchandani@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 13, 2026 at 10:20:21PM -0800, Niloy Meharchandani wrote:
> Initialize st->lock via devm_mutex_init() instead of mutex_init() in
> ad9834_probe() and propagate any initialization error. Since ad9834
> already manages its remaining resources with devm_* helpers and defines
> no remove() callback, using devm_mutex_init() ensures proper mutex
> cleanup on probe failure or device removal when CONFIG_DEBUG_MUTEXES is
> enabled.

Reviewed-by: Arnav Kapoor <kapoorarnav43@gmail.com>
