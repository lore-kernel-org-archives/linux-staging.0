Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067C118C031
	for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 16:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649308; cv=none; b=InF6Owbbzr3FmI2e0vc+dR6BumG6gtTafhdg+PmimXvTVmj6mor0tUz77JLgo7VcJiod8gtoSIiw8oH9lKFC5SqakiqwToaeYsCiF935qsmzNM/4NVD+mLvQ9b9W60nV0+AfQ5o7IvVx9KCI55V2QYWm9QxzNovx068N5pDwIW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649308; c=relaxed/simple;
	bh=IMPpmSGNgTERs/O4E0W84aAiLk4GyRsj/gZ9lKv00ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fZ7DUnTOJfvz/FGTeqPk9pxQcvhGGoIA9lmSyK8gxe3LuOV6IO6/nq/UAnbfQz5AhdxUedAQvFd5uSiRQ+wMLQ1U0uhTGvW9efSM5PEFA6rab1X7jbAG1Z1+4/FYGEDrmJw+9enpJiVmGPYci6SE02VkrT3S4r8hCXIUv/4gZLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQfJKg1B; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQfJKg1B"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso1335922b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 09:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744649306; x=1745254106; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ODC2OMPiIrGbg/DjmPjdt1iuNoNfGR/iB3ClA/te5kQ=;
        b=lQfJKg1BDkyoC6nhHKTyaEBI0Z2vfZCScXYuTDUH+2tD9CvpbUcFhndTQdxgKybM1W
         f8h6z7qdDcq3lD9v4n4FaINJxjye0wPqzQPQc9IxYu2cafZenY5qlVEsp1aWr+4bg0c1
         SsFZ2gfR/KOA6N3qSM2/ELhQ+ISMZSeg9+2Ac1OjXlF870i4pwM2/bys8jTRJ1ZNF2rk
         aVj7U29HAdHdQbDsFUxDk4wDhw/ojqo3LB1JWIMqwOkrOf9DCwZF41YduhcGWEJb5r6R
         bs8XKVuHANyDRJSv3lVhrXwoFqIDEtw/6j8C+rXISiRn8aPMTDmUz5PKjzjFohVrDeBt
         jMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744649306; x=1745254106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODC2OMPiIrGbg/DjmPjdt1iuNoNfGR/iB3ClA/te5kQ=;
        b=aoU7ibJzSbkkZG3NBbgKVunlJ+WFwm3u04E2yX+WeI/ymwFechqHIC+usTKxE7Pdt9
         Bwz8U8v0HPewwU9JjREYNErhYUBYlVCo9JUXu2C6MbcosbQrjslgBl7vbg7Ri1p72ZD8
         rwdn/08//1KnlGTwwa4GkcP7bB0G7bBzVT/mFaUszQCp50RKGAxlPdSWERRqR6D8TcjW
         nAQw0135Iqnf+rUYtJCDzJ3TfNcTJtlkyQ2SZpXPqeksOcg04tLCyXyKkpqbCnuAVkGU
         w7l4/UQnTxX2msh8yWr4DydOk+OeCJnJcLZWuwRu1tj42oeZK41Szxsg2Rxc/bS/c2/W
         cIPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXGNpjqQ4d1SDZmNSpScdU5SUYnJ7BXSer+I6d4+e02hSYN12K2lCPE8X4aF64Ks7tD8QmDUuFpx0zxYQF@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2MymP/IemD1RZo5L6UBKO8QO95Mqx44IsP9TTJrz1MH2zQSHg
	22doj0dEJd82FRlBjx5t9op2HJ+GrPpOR42NVLa7BytQxseZdcYh26av8mFVCRE=
X-Gm-Gg: ASbGncscAtC/OXflVYpPyrPTbW+KGxZ1Uk3nqVGZXjOpL9cJb++YPiCJeXOL33/cbkY
	vDtUzrC3JnNtIAH/mQO4rQHe+8W94vheo+Co4jIMLibsRZZdz7ESJkAhJTmS0Ph/OKY8iM5tzBU
	1rNJgJCkGGUElCc9wqp/A+iO8Y6EJy6uxXgQ8uEK9OpDixYpKBwpjcasgnSRoGZg0a2d0vpWbJn
	dRR/89WN91niZsJJSb1Zuv06/xasnCwvBx8pX7J/N3ZVZgcHtC8r5j3eLeSeXwH9PE9K58oJF7/
	819UccmPkDZ+hYvyJMVHNyZ+ukAZ25kIQBukww==
X-Google-Smtp-Source: AGHT+IGQPFkuLvBdIXu8RgihuXeeTxJXEaC3yFUvhcm0uj/MhC9/nUyCI3fWNBm+MqTxe/husNsVXQ==
X-Received: by 2002:a05:6a00:1414:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-73bd11fe7d1mr16905267b3a.12.1744649305880;
        Mon, 14 Apr 2025 09:48:25 -0700 (PDT)
Received: from fedora.. ([2405:201:f022:f80b:bc98:df72:df5a:60fa])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c5f51sm7084351b3a.56.2025.04.14.09.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 09:48:25 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	Michael.Hennerich@analog.com,
	lars@metafoo.de,
	marcelo.schmitt1@gmail.com,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH] Documentation: iio: Document ad9832 driver
Date: Mon, 14 Apr 2025 22:17:49 +0530
Message-ID: <20250414164811.36879-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Analog Devices Inc. AD983X chips will benefit from a detailed
driver documentation.

This documents the current features supported by the driver.

Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 Documentation/iio/ad9832.rst | 119 +++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/iio/ad9832.rst

diff --git a/Documentation/iio/ad9832.rst b/Documentation/iio/ad9832.rst
new file mode 100644
index 000000000000..a3a58569ff89
--- /dev/null
+++ b/Documentation/iio/ad9832.rst
@@ -0,0 +1,119 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+================
+AD9832 driver
+================
+
+Direct Digital Synthesizer driver for Analog Devices Inc. AD9832 and AD9835.
+
+Supported devices
+=================
+
+The following chips are supported by this driver:
+
+* `AD9832 <https://www.analog.com/AD9832>`_
+* `AD9835 <https://www.analog.com/AD9835>`_
+
+The AD9832 is a numerically controlled oscillator employing
+a phase accumulator, a sine look-up table, and a 10-bit digital-
+to-analog converter (DAC) integrated on a single CMOS chip.
+
+Supported features
+==================
+
+SPI wiring modes
+----------------
+
+The driver currently supports the following SPI wiring configuration:
+
+3-wire mode
+^^^^^^^^^^^
+
+In this mode, communication occurs via SCLK, SDATA, and FSYNC signals.
+
+.. code-block::
+
+    +-------------+         +-------------+
+    |       FSYNC |<--------| CS/GPIO     |
+    |             |         |             |
+    |    AD983X   |         |     HOST    |
+    |             |         |             |
+    |       SDATA |<--------| MOSI        |
+    |        SCLK |<--------| SCK         |
+    +-------------+         +-------------+
+
+
+Channel configuration
+---------------------
+
+The AD9832 features two frequency registers (FREQ0 and FREQ1) and
+four phase registers (PHASE0, PHASE1, PHASE2, and PHASE3).
+The selection of which of these registers is actively used to generate
+the output waveform can be controlled in two ways: via external pins or
+via internal control bits.
+
+* Pin Control: The ``FSELECT`` pin determines whether FREQ0 REG or FREQ1
+  REG is used.
+* The ``PSEL0`` and ``PSEL1`` pins select which of the four PHASE registers
+  is active.
+* These pins are sampled on the rising edge of the master clock (MCLK).
+* Bit Control: This is utilized by the driver for the selection of the
+  frequency and phase registers can be controlled using internal bits.
+* Bit D11 (within a control word) can select the FREQx REG, and Bits D9 and
+  D10 can select the PHASEx REG.
+
+The source of control, whether from the external pins or the internal bits,
+is determined by the SELSRC bit (Select Source bit, D12) within a control
+register.
+When SELSRC = 0, the pins are used for selection, which is the default state
+after the CLR (Clear) bit is set high. When SELSRC = 1,
+the internal bits are used for selection.
+
+Synchronization
+---------------
+
+The SYNC bit (D13) determines how the reading of the FSELECT, PSEL0, and
+PSEL1 pins (when SELSRC = 0) is synchronized with the master clock (MCLK):
+
+When SYNC = 1: The reading of the pins is synchronized with the rising edge
+of MCLK. This ensures the inputs are valid at the sampling instant, even if
+the setup and hold times are violated. This mode introduces a latency of 8
+MCLK cycles.
+When SYNC = 0: The sampling occurs asynchronously, and the latency is reduced
+to 6 MCLK cycles if the timing characteristics are met.
+
+The SYNC bit is particularly important in applications where the timing of
+register selection changes is critical or when interfacing with control systems
+that may not strictly adhere to the setup and hold time requirements.
+
+Power Supply
+------------
+
+The AD9832 supports separate power supply pins for the analog and digital
+sections via the ``AVDD`` and ``DVDD`` inputs. Both pins support voltage
+ranges from 2.97V to 5.5V (5V ±10% or 3.3V ±10%).
+
+Proper decoupling is critical: both AVDD and DVDD should be decoupled with
+0.1µF ceramic capacitors in parallel with 10µF tantalum capacitors to AGND
+and DGND respectively.
+
+The device also supports a low power sleep mode, reducing current
+consumption to 350µA maximum. When powered down using the power-down bit,
+power consumption is reduced to 5mW (5V) or 3mW (3V).
+
+Reference Voltage
+-----------------
+
+The AD9832 supports using either an internal 1.21V reference or an external
+reference voltage via the ``REFIN`` input.
+
+If ``refin-supply`` is present, then an external reference of 1.21V nominal is
+supplied to the REFIN pin. If not specified, the internal reference is used
+and is available at the ``REFOUT`` pin.
+
+The internal reference has an accuracy of 1.21V ±7% min/max across the full
+temperature range (-40°C to +85°C) with a typical temperature coefficient of
+100 ppm/°C. The REFOUT pin should be decoupled with a 10nF capacitor to AGND.
+
+For applications requiring reduced wake-up time at low power supplies and
+low temperatures, the use of an external reference is recommended.
-- 
2.49.0

