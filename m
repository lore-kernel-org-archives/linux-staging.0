Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EABB2D3EEB
	for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 02:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786747; cv=none; b=C037AS2VZCyxlNW4kWz+itxH/725IDjAy7noUMENzlXYI5b9wWnEocuNSEk/jmh1TKJ9AtUdVYTDm4u4U5NG9s8cgsnFLfxnO4PC+VgazF/147Q7qjuIrdCykhhX7RpALfCZwOTO+iluBNAi7YfWynXn/xZJPEcyddok6+Jygy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786747; c=relaxed/simple;
	bh=YajLatm1N39wTUS/2spLdpOg4xpSAjkOcr5obwgS3UY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R9GCJly8EH7ry2h79UHT6qbPhsjOLbM7VPs9vNkmUYk39ydpgUcRRAThwhutdXDCdPoL/IGIWvHNWIIROOReGmU3OpDyeS692ujp+0r3Axfvle91GvDhr7+XXVRnJz9aXdNvNXqqMQ0OXtYHmHCePQg4AcfL5MIMsfFscAahyzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQRFFsrB; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQRFFsrB"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6b1ae6b2010so833877eaf.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 19:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789786745; x=1790391545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCesOAxM2IbdAjwoghFpZoYF2NflnmReXHRHMAC19yM=;
        b=BQRFFsrBLdwQ+3BVWd7f6WJzSei4gJwvUi+I0Uti0xfdwMNnKAqEDpipj55WAxb0n9
         rN4uvuulF4Rk8loAlQnyygn9bcep5/ujHM9grTFXdjh/BOKJn8Q5AZoVaJ4m8JvRQ03U
         N/YWNeDxEdjFCG+WfC098ePRJ+frHo/gjmqchPdF9LS8g8k7Lz1/xS24ZBS4rz7YgrTw
         EVqTYQszTNRo6i837Y9VqVrdQDX6sI0nCaC2xiMT1mawgq115oYS+F7bC40PYssSNSc4
         Mivms09/vwWlpGunGZBbj0OVE1/MuPKbpvYGSRM70kn1g7cHeGvR5tYOGlu8ZD2o3/CC
         TULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789786745; x=1790391545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCesOAxM2IbdAjwoghFpZoYF2NflnmReXHRHMAC19yM=;
        b=GseaR7niaZCy7of/qzNF0VikVi8BFJEp0Nz2dE4Qfx+4ejh/GGtxVKCNgiN6TbJoAH
         nzfqCezqCh9qUQ2HWqeMPT8dDZ3FY2DKfir3+5jtqZNXso78rUs3bbJsu7fhaNe+M2s4
         BaFy1K46ur9SDSsi14oxUm0hkB60GEPu6ZQBLyOhB6Hlj8ubD4gFiekc/YteZokOl/yu
         vHg5/7A/Wv3BPmbj0Lg6Y5vtcIV6U6W3dmjNZNQITo1v9RiAKqJ8yUP9X+3uK4j5X2sG
         4VogO40MV/QUQ86coFmfzmmIuA5Ip5iJ20JKMspfhL9fVsT9OteT8bOtI7vEvuxdbo6b
         93wA==
X-Forwarded-Encrypted: i=1; AKwUvBygEJS6s6NC4dJ1nlouNjsMt+u2BZa9RGivkFAITl37Uj8jQkciqJVw11s2IUyufGsA/oAoLLZwuMnq5gfT@lists.linux.dev
X-Gm-Message-State: AFuF++kkUIA25/1A8jPa+IAXYkunQb+Xc/BavXSu3+9hva9DYl3YMbvA
	lavMr2C5cmnlJVe5r9l32Aw42QuGXIixb3Z+/ZoQFyFiCLVPqt8Wu3Dk
X-Gm-Gg: AYBFou2qqWz+bZ6oxm9nyMW7C1tMSNM/wUwrwXPwtRD+4Ra8mnAv6sd4E4DvKv4K7ax
	olndsxktqyYqJM9sc7bqfyxV5lT4PmjQDXeIWzitW3UHMJ3WW0fZBdNu7n80kAeQxJsUgiE307A
	ZU6zTG/rFt45KYcEp3Vgi+e5tdSd/wG37YBni6POgQj4VxCJOJalV6gDTtkXAeoJ/TxXMwAJe0E
	PxLkTiYP+thGuT6y5JphHhjm+e/Ll4S2P21RgCLDfa9Uki0ja7WRZoZrNS6F4BSsEXNdvjQlSRl
	XDi8CyUlkwIkkLF+EwHaLITHpr0HUho2DW+rMeXl2U0+ykuQHsdqqbAFGtsproVO6JhTEM4UPRB
	6SwPHFyxeWwJoUmez/1WOH8aHttuyDxG6JKzx9eydbGBv1+IJPl8CQlo7dTQLaYZeu9z5azAY9x
	FpXa3yRjXKwEAOQH7ABxGPsnOtsZO3Tk7+FFa/ww05qLgGnyrYjKDm2Wkmh97rb5T2VkAu6FwFQ
	34eHKanH+yg1jzpuHX4yJlhoJLTq9GcvgBOdX9qG+P/47P7/LyNA5KhsE6cxnaRCF5YZyoE0Q==
X-Received: by 2002:a05:6820:1988:b0:6b1:89ff:8a1a with SMTP id 006d021491bc7-6ca9a1326a3mr4442238eaf.3.1789786744895;
        Fri, 18 Sep 2026 19:59:04 -0700 (PDT)
Received: from DESKTOP-FG7FD3B.localdomain (fixed-187-189-149-136.totalplay.net. [187.189.149.136])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd2ea874c3sm1904355eaf.0.2026.09.18.19.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 19:59:04 -0700 (PDT)
From: Daniel28972897 <danyboy28sep@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Daniel28972897 <danyboy28sep@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: misc: convert axis-fifo binding to YAML
Date: Fri, 18 Sep 2026 20:58:58 -0600
Message-Id: <20260919025900.169703-1-danyboy28sep@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919011417.156828-1-danyboy28sep@gmail.com>
References: <20260919011417.156828-1-danyboy28sep@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the axis-fifo devicetree binding conversion, addressing
review feedback from the Sashiko AI bot on v1:

- The FIFO depth properties are documented in 32-bit words, not bytes,
  matching the original text binding and the driver's own arithmetic.
- additionalProperties: false no longer rejects real-world devicetrees,
  since all properties generated by the Xilinx IP integrator (even
  ones the driver ignores) are now listed in the schema.
- The now-superseded drivers/staging/axis-fifo/axis-fifo.txt is
  removed, split into its own patch per
  Documentation/devicetree/bindings/submitting-patches.rst.

Daniel28972897 (2):
  dt-bindings: misc: convert axis-fifo binding to YAML
  staging: axis-fifo: remove superseded text binding

 .../bindings/misc/xlnx,axi-fifo-mm-s.yaml     | 150 ++++++++++++++++++
 drivers/staging/axis-fifo/axis-fifo.txt       |  96 -----------
 2 files changed, 150 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/xlnx,axi-fifo-mm-s.yaml
 delete mode 100644 drivers/staging/axis-fifo/axis-fifo.txt

-- 
2.34.1

