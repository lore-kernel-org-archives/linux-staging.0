Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442582DB788
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 02:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781836576; cv=none; b=T6aBH4y+rWzNmInT53axKUPrvOZwt0r7FXW09izbfPkuooH7GlmJWDaX5eHzipkOuJv+vjy4lN411P/UiK6g8Rn4rDM0FuHQpRYkBoevZL2SCkhYn2E2479X1wOTz6qw4ORSwle2nBS0Oy+CpF5S3FLiJgvE9VYRA62JMLhdxV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781836576; c=relaxed/simple;
	bh=uLJXlYx7wcOWsPeFy9gNmfIk9XvzdJeo7mJlUDmtkdA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Q8nMI5No0tUWrFHDQvxShmmTK3jFOZpWo5VbFd/D72qM73gr5jTvAjK1ox+YWgNIYbAjiDdTYqDJqM8vek0Tqv9UbweMTrAKFatbztuMdPmnKf4N+JTZpQvH/e55UeHPOPLo1o1ePBp70YL+wIlT8kjbMuSpcvVG0z3VER6UBkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bS1lQC8q; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bS1lQC8q"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8454160043aso1177074b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 19:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781836574; x=1782441374; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XHqEORpslI1FT63Z8ElNeWMRAg3ec3xTp1z9QP8/uho=;
        b=bS1lQC8q2pBQbhHlYwS+1psdCXJoxRPO28mqNyvgugZge9Bh4/JhEk6tTXncoUWxcZ
         njc2Ff+AVwAlx3HUJNxQpj3G3tXxTNns/t6wzYZJoznMWrBwIe8gRZpqsG9HzWkdqSb7
         KGwsGdZN1jz6CBYGwWB3Cb892Q7UJuB7y5tJo1mc8DJtOwT59Kk/3zd/pvOjO3Iygg5D
         /a8PcAWbFonzfkvFiJypIhCmrTHwF2Ay6+u2wqcKq+yr3gqBiZ6oXnKCUHRdPkFo9/sn
         nCyX3IHMSytcydU5JqEHHdIaCfSuQj8HCeqHl9P7weuxxFXrMFqzc/LxTB8P1zSyFB5T
         IGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781836574; x=1782441374;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHqEORpslI1FT63Z8ElNeWMRAg3ec3xTp1z9QP8/uho=;
        b=LdkHuXYppw7iRWm3JLV+qvN6HENNT1QgO64S9GNtub6CsVyq8C1XuIB+aEs9/IxdLV
         ENcNFJv2sprnpfjfO5WDiwyIgUZsSzZ03G6KlKWXbtqyDywCIzPRHCAxwzMxA1AftjR2
         oaKukWvkq+9ho5x7KY6qZYS7AE6LEWnuIvJmVfi0XkhFXsNe8K7EeXTU+Ou0DiHfetGv
         ZO3rnTn1y+Yp3/vOsjxHPuW7sAVst0qWWNS8lyM/EOwdX4lUMruMer3Th8zFrnYT5Oft
         gY7FkaS5i86peD6Ak+A+j8wBcke0yjXliFLI60nBaA5Bhb2dr4z2s+LBwyGcTyqU2wfC
         AZ5A==
X-Forwarded-Encrypted: i=1; AFNElJ/M3RkH5orIoJ8CYGTagmuJd3m0rVS+DtdCB3vptZ6l4ywClrQVsZvSvfRmSdok04MBEHYFoyehHarwEuao@lists.linux.dev
X-Gm-Message-State: AOJu0YzXmpM3uqNFQL4I5kIspJHdQUUxM3cT82u7NgOoQh3h6h2knfQX
	GzTlCtRvbWqgupqrGGILw0sLycjG/2tkT0MSeZKOpurtwb41q4yA6po0
X-Gm-Gg: AfdE7cmLVdCKQ7DgDvcX7Y5GDGaJC1erTDMcbC1i0Kqd/7Rd9lqIFEaxE76/v8ZnHJf
	bVQ04wj6nFFqb6jP63XMcioRCJ3PtG4i0B0chjlvA2Z/Kzpe4/TdAKtWrbzyVc+lwo6KKrPxSf7
	xuCPJVqdGECzmyux1TxWosQxwmTja0L4WfMmJEliBf6+fgJjEMm6YSFnFXUsrAE6glGfUG5JqDP
	U0JnTc1FBTFctg3NnZtbuzQhV/bv6ku537u4QVSxQZ23eRc3UfZ2jCj6r4euEY1sjEMEY8rkGsV
	TA+vAM1xGWHAGAWhf8P9joytyiG7WSlSRZV/Kk12MR0YpDiql0pB1qNwRxJNJidjITJ30FuAglK
	G89oW8xZOLlnnZzHBLVNXHg8mhqoMX5HBDQSE6F5M231jTUC0VZp77QkZWoiaBYxFGx6SdU2DeC
	HXqR1h0jAtFG8W5eispfgqTGSwV5KW/R0oLMku3w==
X-Received: by 2002:a05:6a00:4f96:b0:842:77ab:35df with SMTP id d2e1a72fcca58-8455079fd98mr1677838b3a.11.1781836574505;
        Thu, 18 Jun 2026 19:36:14 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845537fa674sm530464b3a.33.2026.06.18.19.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 19:36:13 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To:
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 staging: greybus: audio: possible out of bounds read in the topology parser
Date: Fri, 19 Jun 2026 10:36:10 +0800
Message-ID: <178183657058.3862365.12892304946786698397@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi all,

I think the Greybus audio topology parser in
drivers/staging/greybus/audio_topology.c can read past the topology blob
when a module reports inconsistent counts. I would appreciate it if you
could take a look.

gb_audio_gb_get_topology() allocates the blob to a device-reported u16 size
and only checks that it is at least sizeof(struct gb_audio_topology).

	size = le16_to_cpu(size_resp.size);
	if (size < sizeof(*topo))
		return -ENODATA;
	topo = kzalloc(size, GFP_KERNEL);

After that the parser trusts the interior fields. gb_generate_enum_strings()
walks one C string per item with no end pointer.

	items = le32_to_cpu(gbenum->items);
	for (i = 0; i < items; i++) {
		strings[i] = data;
		while (*data != '\0')
			data++;
		data++;
	}

items is a device le32 and there is no guarantee the blob holds that many
NUL terminated strings, so the while loop runs off the end of the
allocation. The same pattern is in gbaudio_tplg_process_header(), which
derives the control, widget and route offsets by adding device le32 block
sizes with no check against the end of the blob, and in the csize cursor
advance in gbaudio_tplg_process_kcontrols() and gbaudio_tplg_create_widget().

The whole blob is device data parsed on the probe path with no privilege
needed. The attacker here is a malicious or faulty Greybus audio module on
the interface.

I reproduced the enum string walk under KASAN on 7.1-rc7. A blob with one
NUL per item stays inside the allocation. A blob with missing terminators
makes KASAN report a slab out of bounds read past the buffer.

I have a partial fix that passes the buffer end into the enum walk and stops
on overrun. A complete fix also needs to bound the header offsets and the
csize advances against the allocation size, so I wanted to ask before
sending a series.

Does this look like a real bug to you? If it does I am happy to send a
proper patch. The parser was added in c8e6336bb3f8 ("greybus: audio: Add
topology parser for GB codec"), which I think is the right Fixes tag.

Thanks,
Maoyi
https://maoyixie.com/
