Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFA419B586
	for <linux-staging@lists.linux.dev>; Wed,  8 Jan 2025 17:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736358100; cv=none; b=KTaVQTXrmmUZp6ofibuTT7wmVCk4Nx/y97sBk5kzVovrSPNIUOsGRqqJwe8vtrk+2mDYXl/MQlXkx4mReYyywuy2N3CDzy+hxkkkRtT/FYFbwhev9IaY6kT4c7M77ax1YFzNXX3K05kLfdkwKGPgnXP2YCrSusH8cJ0tB5WOROc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736358100; c=relaxed/simple;
	bh=QTAU8gpnvSU6zFbD8IwriJ1ISypSGV+qHGmXPyCPpp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qW4fJVv9B0wwlNhVMGU4SJG3qWFUiqpWzFyaGrrQxqmye+P744SlwPOcPrprs4q7/11BrQT7G+zKgo2UKbn3nqSLFctTpGNazGlH9cJSslFL0oF8x5VipLM7UhFzU6dfwGylYzgxSQXlBoAdmu99Wm0zrmwwawHImukiEr75E9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsLfOvPK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsLfOvPK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso1147995e9.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Jan 2025 09:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736358092; x=1736962892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAb7DFDwjpS5Z/QlshjUgQMkBQrtWz/jykny7eKiBHU=;
        b=RsLfOvPKhv60smIsM4a+fVAQ6h7szgu0Utu8Ou9kc4CwS5FUyqJCXogqqdzxdih76S
         u+yMlCRYUFHZB5DiN13JuxsLluiz16vtHs/IL3YZHQhrTytVeMk5g1EPk4yAD7bTC3w1
         qQ9Y2F/yWZ0G0Yi8himLCaRJR2RpPkywcborG6eOe+nGnLRQy4JzBhQT52AB319g24Yr
         cZWzyJWIjlw2DiD/dmGccJ4HgvcfzxrXd+LJFxTrM2HzKt6UzukBojkAtflM7C7llTE4
         lWZ4U1gv5TE+vGzFMnbVsfFZJMUXDdbTBHwbIH8j6y1EOTU7eC3jsxQtjfWWQg+jmtd3
         l5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736358092; x=1736962892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAb7DFDwjpS5Z/QlshjUgQMkBQrtWz/jykny7eKiBHU=;
        b=tH+Lu5/sZZIABZcoruWAyZAkQKP1gwyXJftVcjMEc22eaY8AD3pah3hqwffBGEr67D
         Jfu1f5UEZ1CkRIKpbRKpF8YjGkbDy5omar3EkEdtOh4gZ5aI1s8HA/t1iWejV7kfiQrO
         qQBPQ/G9Fv5+f7RJ6JjOtVdQgBAY9ByS7j122A68d0m8bnSTpbfiIZP+RNJieYPQFuu3
         jzW/NDNj4rjlD++8/nSEdY9BvYdd997HueBMYj7wESgXVhK7zt5OEx3owzusNWqy4/PC
         qRXU/N1chfkUk2jHwwGgWU1mG4fUv9baX6Lz0R88LRa+/gc4N0e6JJBHJjsDtltaoQrh
         m+qA==
X-Forwarded-Encrypted: i=1; AJvYcCUkxWo0qoINB28DhnxG7eAebFPD2B6LFhCH99z7qO5wDpjWPRIswVBLzacfP16XyAYZ5n4cAe3WybiZHt5Z@lists.linux.dev
X-Gm-Message-State: AOJu0YzorXriGNpjbCH+MFi8pY5fb0AKyXNwnqKaUAzhsu1FEJJHMcXL
	+Wc5n+FfURJ/u45QhAUMveQiXSN282tL4WslzAWYnNRa5u3koT3T
X-Gm-Gg: ASbGnctLdckPAbJtf8Gt4VId7rmcQzhtsqwY6t7FA8rv81FP2x3AOyuPFLA27+r/nb2
	jZm5wH6KJM9qqrf95RQWF1RBVx9M/t9bvt9lqYcLI/RMbw8SLjqm63OcH/9qGcFU/SiMK/p7zxy
	o9WlvfyMFyNM+9/++RkrGk7VUyjKR1LCW8G97I3Kk6ayMqOHY0GTN4gN9OCKydmqvTHup/npMxa
	8yX8EEu3upXkQ65iwh0aY5QEzb0kIsGbakJve4zbApwobSNeWEvbuxU1SyQUDjfY39/AeskBQ5o
	ahUAg5WVsPa3cKRi
X-Google-Smtp-Source: AGHT+IG5288LzwN+gDU/jjs1363C89WHPv/lGGIzEiE4qycDOSDGRnTC4DK4L7JAlHKK47z8irTUSA==
X-Received: by 2002:a05:600c:138d:b0:431:44f6:566f with SMTP id 5b1f17b1804b1-436e26c4a1amr34814385e9.13.1736358091919;
        Wed, 08 Jan 2025 09:41:31 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dcc8f8dfsm41358115e9.0.2025.01.08.09.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:41:31 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v2] staging: gpib: Modernize gpib_interface_t initialization and make static
Date: Wed,  8 Jan 2025 18:41:21 +0100
Message-ID: <20250108174121.23044-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All interface drivers were using the old style initialization of
this struct

field : value;

This generated the followng sparse warning, for example:
agilent_82357a/agilent_82357a.c:1492:1: warning: obsolete struct initializer, use C99 syntax

Change the initialization to use the C99 syntax

.field = value;

This also resolves the checkpatch constraint of no indentation.

These structs were also not declared as static, unnecessarily polluting
the symbol namespace and generating the following sparse warnings,
for example:

agilent_82357a/agilent_82357a.c:1465:18: warning: symbol 'agilent_82357a_gpib_interface' was not declared. Should it be static?

Declare them as static and remove any conflicting extern declarations
in the corresponding include files.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
v1 -> v2 Add subsystem prefix to subject

 .../gpib/agilent_82350b/agilent_82350b.c      | 100 ++--
 .../gpib/agilent_82350b/agilent_82350b.h      |   2 -
 .../gpib/agilent_82357a/agilent_82357a.c      |  56 +-
 drivers/staging/gpib/cb7210/cb7210.c          | 464 ++++++++--------
 drivers/staging/gpib/cec/cec.h                |   4 -
 drivers/staging/gpib/cec/cec_gpib.c           |  52 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c    | 150 ++---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 208 +++----
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  50 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  52 +-
 drivers/staging/gpib/hp_82341/hp_82341.c      | 102 ++--
 drivers/staging/gpib/ines/ines.h              |   7 -
 drivers/staging/gpib/ines/ines_gpib.c         | 208 +++----
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  54 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  54 +-
 drivers/staging/gpib/pc2/pc2_gpib.c           | 208 +++----
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 520 +++++++++---------
 17 files changed, 1139 insertions(+), 1152 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index e9c1f0100b2a..95bb55b4c0e9 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -828,58 +828,58 @@ void agilent_82350b_detach(gpib_board_t *board)
 	agilent_82350b_free_private(board);
 }
 
-gpib_interface_t agilent_82350b_unaccel_interface = {
-name: "agilent_82350b_unaccel",
-attach : agilent_82350b_unaccel_attach,
-detach : agilent_82350b_detach,
-read : agilent_82350b_read,
-write : agilent_82350b_write,
-command : agilent_82350b_command,
-request_system_control : agilent_82350b_request_system_control,
-take_control : agilent_82350b_take_control,
-go_to_standby : agilent_82350b_go_to_standby,
-interface_clear : agilent_82350b_interface_clear,
-remote_enable : agilent_82350b_remote_enable,
-enable_eos : agilent_82350b_enable_eos,
-disable_eos : agilent_82350b_disable_eos,
-parallel_poll : agilent_82350b_parallel_poll,
-parallel_poll_configure : agilent_82350b_parallel_poll_configure,
-parallel_poll_response : agilent_82350b_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : agilent_82350b_line_status,
-update_status : agilent_82350b_update_status,
-primary_address : agilent_82350b_primary_address,
-secondary_address : agilent_82350b_secondary_address,
-serial_poll_response : agilent_82350b_serial_poll_response,
-t1_delay : agilent_82350b_t1_delay,
-return_to_local : agilent_82350b_return_to_local,
+static gpib_interface_t agilent_82350b_unaccel_interface = {
+	.name = "agilent_82350b_unaccel",
+	.attach = agilent_82350b_unaccel_attach,
+	.detach = agilent_82350b_detach,
+	.read = agilent_82350b_read,
+	.write = agilent_82350b_write,
+	.command = agilent_82350b_command,
+	.request_system_control = agilent_82350b_request_system_control,
+	.take_control = agilent_82350b_take_control,
+	.go_to_standby = agilent_82350b_go_to_standby,
+	.interface_clear = agilent_82350b_interface_clear,
+	.remote_enable = agilent_82350b_remote_enable,
+	.enable_eos = agilent_82350b_enable_eos,
+	.disable_eos = agilent_82350b_disable_eos,
+	.parallel_poll = agilent_82350b_parallel_poll,
+	.parallel_poll_configure = agilent_82350b_parallel_poll_configure,
+	.parallel_poll_response = agilent_82350b_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = agilent_82350b_line_status,
+	.update_status = agilent_82350b_update_status,
+	.primary_address = agilent_82350b_primary_address,
+	.secondary_address = agilent_82350b_secondary_address,
+	.serial_poll_response = agilent_82350b_serial_poll_response,
+	.t1_delay = agilent_82350b_t1_delay,
+	.return_to_local = agilent_82350b_return_to_local,
 };
 
-gpib_interface_t agilent_82350b_interface = {
-name: "agilent_82350b",
-attach : agilent_82350b_accel_attach,
-detach : agilent_82350b_detach,
-read : agilent_82350b_accel_read,
-write : agilent_82350b_accel_write,
-command : agilent_82350b_command,
-request_system_control : agilent_82350b_request_system_control,
-take_control : agilent_82350b_take_control,
-go_to_standby : agilent_82350b_go_to_standby,
-interface_clear : agilent_82350b_interface_clear,
-remote_enable : agilent_82350b_remote_enable,
-enable_eos : agilent_82350b_enable_eos,
-disable_eos : agilent_82350b_disable_eos,
-parallel_poll : agilent_82350b_parallel_poll,
-parallel_poll_configure : agilent_82350b_parallel_poll_configure,
-parallel_poll_response : agilent_82350b_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : agilent_82350b_line_status,
-update_status : agilent_82350b_update_status,
-primary_address : agilent_82350b_primary_address,
-secondary_address : agilent_82350b_secondary_address,
-serial_poll_response : agilent_82350b_serial_poll_response,
-t1_delay : agilent_82350b_t1_delay,
-return_to_local : agilent_82350b_return_to_local,
+static gpib_interface_t agilent_82350b_interface = {
+	.name = "agilent_82350b",
+	.attach = agilent_82350b_accel_attach,
+	.detach = agilent_82350b_detach,
+	.read = agilent_82350b_accel_read,
+	.write = agilent_82350b_accel_write,
+	.command = agilent_82350b_command,
+	.request_system_control = agilent_82350b_request_system_control,
+	.take_control = agilent_82350b_take_control,
+	.go_to_standby = agilent_82350b_go_to_standby,
+	.interface_clear = agilent_82350b_interface_clear,
+	.remote_enable = agilent_82350b_remote_enable,
+	.enable_eos = agilent_82350b_enable_eos,
+	.disable_eos = agilent_82350b_disable_eos,
+	.parallel_poll = agilent_82350b_parallel_poll,
+	.parallel_poll_configure = agilent_82350b_parallel_poll_configure,
+	.parallel_poll_response = agilent_82350b_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = agilent_82350b_line_status,
+	.update_status = agilent_82350b_update_status,
+	.primary_address = agilent_82350b_primary_address,
+	.secondary_address = agilent_82350b_secondary_address,
+	.serial_poll_response = agilent_82350b_serial_poll_response,
+	.t1_delay = agilent_82350b_t1_delay,
+	.return_to_local = agilent_82350b_return_to_local,
 };
 
 static int agilent_82350b_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.h b/drivers/staging/gpib/agilent_82350b/agilent_82350b.h
index 30683d67d170..6915c1b2c85b 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.h
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.h
@@ -60,8 +60,6 @@ struct agilent_82350b_priv {
 // driver name
 extern const char *driver_name;
 
-// interfaces
-extern gpib_interface_t agilent_82350b_interface;
 // init functions
 
 int agilent_82350b_unaccel_attach(gpib_board_t *board, const gpib_board_config_t *config);
diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 261fb6d2e991..b21eadabc466 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1462,34 +1462,34 @@ static void agilent_82357a_detach(gpib_board_t *board)
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 }
 
-gpib_interface_t agilent_82357a_gpib_interface = {
-name: "agilent_82357a",
-attach : agilent_82357a_attach,
-detach : agilent_82357a_detach,
-read : agilent_82357a_read,
-write : agilent_82357a_write,
-command : agilent_82357a_command,
-take_control : agilent_82357a_take_control,
-go_to_standby : agilent_82357a_go_to_standby,
-request_system_control : agilent_82357a_request_system_control,
-interface_clear : agilent_82357a_interface_clear,
-remote_enable : agilent_82357a_remote_enable,
-enable_eos : agilent_82357a_enable_eos,
-disable_eos : agilent_82357a_disable_eos,
-parallel_poll : agilent_82357a_parallel_poll,
-parallel_poll_configure : agilent_82357a_parallel_poll_configure,
-parallel_poll_response : agilent_82357a_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : agilent_82357a_line_status,
-update_status : agilent_82357a_update_status,
-primary_address : agilent_82357a_primary_address,
-secondary_address : agilent_82357a_secondary_address,
-serial_poll_response : agilent_82357a_serial_poll_response,
-serial_poll_status : agilent_82357a_serial_poll_status,
-t1_delay : agilent_82357a_t1_delay,
-return_to_local : agilent_82357a_return_to_local,
-no_7_bit_eos : 1,
-skip_check_for_command_acceptors : 1
+static gpib_interface_t agilent_82357a_gpib_interface = {
+	.name = "agilent_82357a",
+	.attach = agilent_82357a_attach,
+	.detach = agilent_82357a_detach,
+	.read = agilent_82357a_read,
+	.write = agilent_82357a_write,
+	.command = agilent_82357a_command,
+	.take_control = agilent_82357a_take_control,
+	.go_to_standby = agilent_82357a_go_to_standby,
+	.request_system_control = agilent_82357a_request_system_control,
+	.interface_clear = agilent_82357a_interface_clear,
+	.remote_enable = agilent_82357a_remote_enable,
+	.enable_eos = agilent_82357a_enable_eos,
+	.disable_eos = agilent_82357a_disable_eos,
+	.parallel_poll = agilent_82357a_parallel_poll,
+	.parallel_poll_configure = agilent_82357a_parallel_poll_configure,
+	.parallel_poll_response = agilent_82357a_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = agilent_82357a_line_status,
+	.update_status = agilent_82357a_update_status,
+	.primary_address = agilent_82357a_primary_address,
+	.secondary_address = agilent_82357a_secondary_address,
+	.serial_poll_response = agilent_82357a_serial_poll_response,
+	.serial_poll_status = agilent_82357a_serial_poll_status,
+	.t1_delay = agilent_82357a_t1_delay,
+	.return_to_local = agilent_82357a_return_to_local,
+	.no_7_bit_eos = 1,
+	.skip_check_for_command_acceptors = 1
 };
 
 // Table with the USB-devices: just now only testing IDs
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 45a54219ea6d..d41368407810 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -683,170 +683,170 @@ void cb7210_return_to_local(gpib_board_t *board)
 	write_byte(nec_priv, AUX_RTL, AUXMR);
 }
 
-gpib_interface_t cb_pci_unaccel_interface = {
-name: "cbi_pci_unaccel",
-attach : cb_pci_attach,
-detach : cb_pci_detach,
-read : cb7210_read,
-write : cb7210_write,
-command : cb7210_command,
-take_control : cb7210_take_control,
-go_to_standby : cb7210_go_to_standby,
-request_system_control : cb7210_request_system_control,
-interface_clear : cb7210_interface_clear,
-remote_enable : cb7210_remote_enable,
-enable_eos : cb7210_enable_eos,
-disable_eos : cb7210_disable_eos,
-parallel_poll : cb7210_parallel_poll,
-parallel_poll_configure : cb7210_parallel_poll_configure,
-parallel_poll_response : cb7210_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : cb7210_line_status,
-update_status : cb7210_update_status,
-primary_address : cb7210_primary_address,
-secondary_address : cb7210_secondary_address,
-serial_poll_response : cb7210_serial_poll_response,
-serial_poll_status : cb7210_serial_poll_status,
-t1_delay : cb7210_t1_delay,
-return_to_local : cb7210_return_to_local,
+static gpib_interface_t cb_pci_unaccel_interface = {
+	.name = "cbi_pci_unaccel",
+	.attach = cb_pci_attach,
+	.detach = cb_pci_detach,
+	.read = cb7210_read,
+	.write = cb7210_write,
+	.command = cb7210_command,
+	.take_control = cb7210_take_control,
+	.go_to_standby = cb7210_go_to_standby,
+	.request_system_control = cb7210_request_system_control,
+	.interface_clear = cb7210_interface_clear,
+	.remote_enable = cb7210_remote_enable,
+	.enable_eos = cb7210_enable_eos,
+	.disable_eos = cb7210_disable_eos,
+	.parallel_poll = cb7210_parallel_poll,
+	.parallel_poll_configure = cb7210_parallel_poll_configure,
+	.parallel_poll_response = cb7210_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = cb7210_line_status,
+	.update_status = cb7210_update_status,
+	.primary_address = cb7210_primary_address,
+	.secondary_address = cb7210_secondary_address,
+	.serial_poll_response = cb7210_serial_poll_response,
+	.serial_poll_status = cb7210_serial_poll_status,
+	.t1_delay = cb7210_t1_delay,
+	.return_to_local = cb7210_return_to_local,
 };
 
-gpib_interface_t cb_pci_accel_interface = {
-name: "cbi_pci_accel",
-attach : cb_pci_attach,
-detach : cb_pci_detach,
-read : cb7210_accel_read,
-write : cb7210_accel_write,
-command : cb7210_command,
-take_control : cb7210_take_control,
-go_to_standby : cb7210_go_to_standby,
-request_system_control : cb7210_request_system_control,
-interface_clear : cb7210_interface_clear,
-remote_enable : cb7210_remote_enable,
-enable_eos : cb7210_enable_eos,
-disable_eos : cb7210_disable_eos,
-parallel_poll : cb7210_parallel_poll,
-parallel_poll_configure : cb7210_parallel_poll_configure,
-parallel_poll_response : cb7210_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : cb7210_line_status,
-update_status : cb7210_update_status,
-primary_address : cb7210_primary_address,
-secondary_address : cb7210_secondary_address,
-serial_poll_response : cb7210_serial_poll_response,
-serial_poll_status : cb7210_serial_poll_status,
-t1_delay : cb7210_t1_delay,
-return_to_local : cb7210_return_to_local,
+static gpib_interface_t cb_pci_accel_interface = {
+	.name = "cbi_pci_accel",
+	.attach = cb_pci_attach,
+	.detach = cb_pci_detach,
+	.read = cb7210_accel_read,
+	.write = cb7210_accel_write,
+	.command = cb7210_command,
+	.take_control = cb7210_take_control,
+	.go_to_standby = cb7210_go_to_standby,
+	.request_system_control = cb7210_request_system_control,
+	.interface_clear = cb7210_interface_clear,
+	.remote_enable = cb7210_remote_enable,
+	.enable_eos = cb7210_enable_eos,
+	.disable_eos = cb7210_disable_eos,
+	.parallel_poll = cb7210_parallel_poll,
+	.parallel_poll_configure = cb7210_parallel_poll_configure,
+	.parallel_poll_response = cb7210_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = cb7210_line_status,
+	.update_status = cb7210_update_status,
+	.primary_address = cb7210_primary_address,
+	.secondary_address = cb7210_secondary_address,
+	.serial_poll_response = cb7210_serial_poll_response,
+	.serial_poll_status = cb7210_serial_poll_status,
+	.t1_delay = cb7210_t1_delay,
+	.return_to_local = cb7210_return_to_local,
 };
 
-gpib_interface_t cb_pci_interface = {
-name: "cbi_pci",
-attach : cb_pci_attach,
-detach : cb_pci_detach,
-read : cb7210_accel_read,
-write : cb7210_accel_write,
-command : cb7210_command,
-take_control : cb7210_take_control,
-go_to_standby : cb7210_go_to_standby,
-request_system_control : cb7210_request_system_control,
-interface_clear : cb7210_interface_clear,
-remote_enable : cb7210_remote_enable,
-enable_eos : cb7210_enable_eos,
-disable_eos : cb7210_disable_eos,
-parallel_poll : cb7210_parallel_poll,
-parallel_poll_configure : cb7210_parallel_poll_configure,
-parallel_poll_response : cb7210_parallel_poll_response,
-line_status : cb7210_line_status,
-update_status : cb7210_update_status,
-primary_address : cb7210_primary_address,
-secondary_address : cb7210_secondary_address,
-serial_poll_response : cb7210_serial_poll_response,
-serial_poll_status : cb7210_serial_poll_status,
-t1_delay : cb7210_t1_delay,
-return_to_local : cb7210_return_to_local,
+static gpib_interface_t cb_pci_interface = {
+	.name = "cbi_pci",
+	.attach = cb_pci_attach,
+	.detach = cb_pci_detach,
+	.read = cb7210_accel_read,
+	.write = cb7210_accel_write,
+	.command = cb7210_command,
+	.take_control = cb7210_take_control,
+	.go_to_standby = cb7210_go_to_standby,
+	.request_system_control = cb7210_request_system_control,
+	.interface_clear = cb7210_interface_clear,
+	.remote_enable = cb7210_remote_enable,
+	.enable_eos = cb7210_enable_eos,
+	.disable_eos = cb7210_disable_eos,
+	.parallel_poll = cb7210_parallel_poll,
+	.parallel_poll_configure = cb7210_parallel_poll_configure,
+	.parallel_poll_response = cb7210_parallel_poll_response,
+	.line_status = cb7210_line_status,
+	.update_status = cb7210_update_status,
+	.primary_address = cb7210_primary_address,
+	.secondary_address = cb7210_secondary_address,
+	.serial_poll_response = cb7210_serial_poll_response,
+	.serial_poll_status = cb7210_serial_poll_status,
+	.t1_delay = cb7210_t1_delay,
+	.return_to_local = cb7210_return_to_local,
 };
 
-gpib_interface_t cb_isa_unaccel_interface = {
-name: "cbi_isa_unaccel",
-attach : cb_isa_attach,
-detach : cb_isa_detach,
-read : cb7210_read,
-write : cb7210_write,
-command : cb7210_command,
-take_control : cb7210_take_control,
-go_to_standby : cb7210_go_to_standby,
-request_system_control : cb7210_request_system_control,
-interface_clear : cb7210_interface_clear,
-remote_enable : cb7210_remote_enable,
-enable_eos : cb7210_enable_eos,
-disable_eos : cb7210_disable_eos,
-parallel_poll : cb7210_parallel_poll,
-parallel_poll_configure : cb7210_parallel_poll_configure,
-parallel_poll_response : cb7210_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : cb7210_line_status,
-update_status : cb7210_update_status,
-primary_address : cb7210_primary_address,
-secondary_address : cb7210_secondary_address,
-serial_poll_response : cb7210_serial_poll_response,
-serial_poll_status : cb7210_serial_poll_status,
-t1_delay : cb7210_t1_delay,
-return_to_local : cb7210_return_to_local,
+static gpib_interface_t cb_isa_unaccel_interface = {
+	.name = "cbi_isa_unaccel",
+	.attach = cb_isa_attach,
+	.detach = cb_isa_detach,
+	.read = cb7210_read,
+	.write = cb7210_write,
+	.command = cb7210_command,
+	.take_control = cb7210_take_control,
+	.go_to_standby = cb7210_go_to_standby,
+	.request_system_control = cb7210_request_system_control,
+	.interface_clear = cb7210_interface_clear,
+	.remote_enable = cb7210_remote_enable,
+	.enable_eos = cb7210_enable_eos,
+	.disable_eos = cb7210_disable_eos,
+	.parallel_poll = cb7210_parallel_poll,
+	.parallel_poll_configure = cb7210_parallel_poll_configure,
+	.parallel_poll_response = cb7210_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = cb7210_line_status,
+	.update_status = cb7210_update_status,
+	.primary_address = cb7210_primary_address,
+	.secondary_address = cb7210_secondary_address,
+	.serial_poll_response = cb7210_serial_poll_response,
+	.serial_poll_status = cb7210_serial_poll_status,
+	.t1_delay = cb7210_t1_delay,
+	.return_to_local = cb7210_return_to_local,
 };
 
-gpib_interface_t cb_isa_interface = {
-name: "cbi_isa",
-attach : cb_isa_attach,
-detach : cb_isa_detach,
-read : cb7210_accel_read,
-write : cb7210_accel_write,
-command : cb7210_command,
-take_control : cb7210_take_control,
-go_to_standby : cb7210_go_to_standby,
-request_system_control : cb7210_request_system_control,
-interface_clear : cb7210_interface_clear,
-remote_enable : cb7210_remote_enable,
-enable_eos : cb7210_enable_eos,
-disable_eos : cb7210_disable_eos,
-parallel_poll : cb7210_parallel_poll,
-parallel_poll_configure : cb7210_parallel_poll_configure,
-parallel_poll_response : cb7210_parallel_poll_response,
-line_status : cb7210_line_status,
-update_status : cb7210_update_status,
-primary_address : cb7210_primary_address,
-secondary_address : cb7210_secondary_address,
-serial_poll_response : cb7210_serial_poll_response,
-serial_poll_status : cb7210_serial_poll_status,
-t1_delay : cb7210_t1_delay,
-return_to_local : cb7210_return_to_local,
+static gpib_interface_t cb_isa_interface = {
+	.name = "cbi_isa",
+	.attach = cb_isa_attach,
+	.detach = cb_isa_detach,
+	.read = cb7210_accel_read,
+	.write = cb7210_accel_write,
+	.command = cb7210_command,
+	.take_control = cb7210_take_control,
+	.go_to_standby = cb7210_go_to_standby,
+	.request_system_control = cb7210_request_system_control,
+	.interface_clear = cb7210_interface_clear,
+	.remote_enable = cb7210_remote_enable,
+	.enable_eos = cb7210_enable_eos,
+	.disable_eos = cb7210_disable_eos,
+	.parallel_poll = cb7210_parallel_poll,
+	.parallel_poll_configure = cb7210_parallel_poll_configure,
+	.parallel_poll_response = cb7210_parallel_poll_response,
+	.line_status = cb7210_line_status,
+	.update_status = cb7210_update_status,
+	.primary_address = cb7210_primary_address,
+	.secondary_address = cb7210_secondary_address,
+	.serial_poll_response = cb7210_serial_poll_response,
+	.serial_poll_status = cb7210_serial_poll_status,
+	.t1_delay = cb7210_t1_delay,
+	.return_to_local = cb7210_return_to_local,
 };
 
-gpib_interface_t cb_isa_accel_interface = {
-name: "cbi_isa_accel",
-attach : cb_isa_attach,
-detach : cb_isa_detach,
-read : cb7210_accel_read,
-write : cb7210_accel_write,
-command : cb7210_command,
-take_control : cb7210_take_control,
-go_to_standby : cb7210_go_to_standby,
-request_system_control : cb7210_request_system_control,
-interface_clear : cb7210_interface_clear,
-remote_enable : cb7210_remote_enable,
-enable_eos : cb7210_enable_eos,
-disable_eos : cb7210_disable_eos,
-parallel_poll : cb7210_parallel_poll,
-parallel_poll_configure : cb7210_parallel_poll_configure,
-parallel_poll_response : cb7210_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : cb7210_line_status,
-update_status : cb7210_update_status,
-primary_address : cb7210_primary_address,
-secondary_address : cb7210_secondary_address,
-serial_poll_response : cb7210_serial_poll_response,
-serial_poll_status : cb7210_serial_poll_status,
-t1_delay : cb7210_t1_delay,
-return_to_local : cb7210_return_to_local,
+static gpib_interface_t cb_isa_accel_interface = {
+	.name = "cbi_isa_accel",
+	.attach = cb_isa_attach,
+	.detach = cb_isa_detach,
+	.read = cb7210_accel_read,
+	.write = cb7210_accel_write,
+	.command = cb7210_command,
+	.take_control = cb7210_take_control,
+	.go_to_standby = cb7210_go_to_standby,
+	.request_system_control = cb7210_request_system_control,
+	.interface_clear = cb7210_interface_clear,
+	.remote_enable = cb7210_remote_enable,
+	.enable_eos = cb7210_enable_eos,
+	.disable_eos = cb7210_disable_eos,
+	.parallel_poll = cb7210_parallel_poll,
+	.parallel_poll_configure = cb7210_parallel_poll_configure,
+	.parallel_poll_response = cb7210_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = cb7210_line_status,
+	.update_status = cb7210_update_status,
+	.primary_address = cb7210_primary_address,
+	.secondary_address = cb7210_secondary_address,
+	.serial_poll_response = cb7210_serial_poll_response,
+	.serial_poll_status = cb7210_serial_poll_status,
+	.t1_delay = cb7210_t1_delay,
+	.return_to_local = cb7210_return_to_local,
 };
 
 static int cb7210_allocate_private(gpib_board_t *board)
@@ -1357,88 +1357,88 @@ void cb_pcmcia_cleanup_module(void)
 	pcmcia_unregister_driver(&cb_gpib_cs_driver);
 }
 
-gpib_interface_t cb_pcmcia_unaccel_interface = {
-name: "cbi_pcmcia_unaccel",
-attach : cb_pcmcia_attach,
-detach : cb_pcmcia_detach,
-read : cb7210_read,
-write : cb7210_write,
-command : cb7210_command,
-take_control : cb7210_take_control,
-go_to_standby : cb7210_go_to_standby,
-request_system_control : cb7210_request_system_control,
-interface_clear : cb7210_interface_clear,
-remote_enable : cb7210_remote_enable,
-enable_eos : cb7210_enable_eos,
-disable_eos : cb7210_disable_eos,
-parallel_poll : cb7210_parallel_poll,
-parallel_poll_configure : cb7210_parallel_poll_configure,
-parallel_poll_response : cb7210_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : cb7210_line_status,
-update_status : cb7210_update_status,
-primary_address : cb7210_primary_address,
-secondary_address : cb7210_secondary_address,
-serial_poll_response : cb7210_serial_poll_response,
-serial_poll_status : cb7210_serial_poll_status,
-t1_delay : cb7210_t1_delay,
-return_to_local : cb7210_return_to_local,
+static gpib_interface_t cb_pcmcia_unaccel_interface = {
+	.name = "cbi_pcmcia_unaccel",
+	.attach = cb_pcmcia_attach,
+	.detach = cb_pcmcia_detach,
+	.read = cb7210_read,
+	.write = cb7210_write,
+	.command = cb7210_command,
+	.take_control = cb7210_take_control,
+	.go_to_standby = cb7210_go_to_standby,
+	.request_system_control = cb7210_request_system_control,
+	.interface_clear = cb7210_interface_clear,
+	.remote_enable = cb7210_remote_enable,
+	.enable_eos = cb7210_enable_eos,
+	.disable_eos = cb7210_disable_eos,
+	.parallel_poll = cb7210_parallel_poll,
+	.parallel_poll_configure = cb7210_parallel_poll_configure,
+	.parallel_poll_response = cb7210_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = cb7210_line_status,
+	.update_status = cb7210_update_status,
+	.primary_address = cb7210_primary_address,
+	.secondary_address = cb7210_secondary_address,
+	.serial_poll_response = cb7210_serial_poll_response,
+	.serial_poll_status = cb7210_serial_poll_status,
+	.t1_delay = cb7210_t1_delay,
+	.return_to_local = cb7210_return_to_local,
 };
 
-gpib_interface_t cb_pcmcia_interface = {
-name: "cbi_pcmcia",
-attach : cb_pcmcia_attach,
-detach : cb_pcmcia_detach,
-read : cb7210_accel_read,
-write : cb7210_accel_write,
-command : cb7210_command,
-take_control : cb7210_take_control,
-go_to_standby : cb7210_go_to_standby,
-request_system_control : cb7210_request_system_control,
-interface_clear : cb7210_interface_clear,
-remote_enable : cb7210_remote_enable,
-enable_eos : cb7210_enable_eos,
-disable_eos : cb7210_disable_eos,
-parallel_poll : cb7210_parallel_poll,
-parallel_poll_configure : cb7210_parallel_poll_configure,
-parallel_poll_response : cb7210_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : cb7210_line_status,
-update_status : cb7210_update_status,
-primary_address : cb7210_primary_address,
-secondary_address : cb7210_secondary_address,
-serial_poll_response : cb7210_serial_poll_response,
-serial_poll_status : cb7210_serial_poll_status,
-t1_delay : cb7210_t1_delay,
-return_to_local : cb7210_return_to_local,
+static gpib_interface_t cb_pcmcia_interface = {
+	.name = "cbi_pcmcia",
+	.attach = cb_pcmcia_attach,
+	.detach = cb_pcmcia_detach,
+	.read = cb7210_accel_read,
+	.write = cb7210_accel_write,
+	.command = cb7210_command,
+	.take_control = cb7210_take_control,
+	.go_to_standby = cb7210_go_to_standby,
+	.request_system_control = cb7210_request_system_control,
+	.interface_clear = cb7210_interface_clear,
+	.remote_enable = cb7210_remote_enable,
+	.enable_eos = cb7210_enable_eos,
+	.disable_eos = cb7210_disable_eos,
+	.parallel_poll = cb7210_parallel_poll,
+	.parallel_poll_configure = cb7210_parallel_poll_configure,
+	.parallel_poll_response = cb7210_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = cb7210_line_status,
+	.update_status = cb7210_update_status,
+	.primary_address = cb7210_primary_address,
+	.secondary_address = cb7210_secondary_address,
+	.serial_poll_response = cb7210_serial_poll_response,
+	.serial_poll_status = cb7210_serial_poll_status,
+	.t1_delay = cb7210_t1_delay,
+	.return_to_local = cb7210_return_to_local,
 };
 
-gpib_interface_t cb_pcmcia_accel_interface = {
-name: "cbi_pcmcia_accel",
-attach : cb_pcmcia_attach,
-detach : cb_pcmcia_detach,
-read : cb7210_accel_read,
-write : cb7210_accel_write,
-command : cb7210_command,
-take_control : cb7210_take_control,
-go_to_standby : cb7210_go_to_standby,
-request_system_control : cb7210_request_system_control,
-interface_clear : cb7210_interface_clear,
-remote_enable : cb7210_remote_enable,
-enable_eos : cb7210_enable_eos,
-disable_eos : cb7210_disable_eos,
-parallel_poll : cb7210_parallel_poll,
-parallel_poll_configure : cb7210_parallel_poll_configure,
-parallel_poll_response : cb7210_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : cb7210_line_status,
-update_status : cb7210_update_status,
-primary_address : cb7210_primary_address,
-secondary_address : cb7210_secondary_address,
-serial_poll_response : cb7210_serial_poll_response,
-serial_poll_status : cb7210_serial_poll_status,
-t1_delay : cb7210_t1_delay,
-return_to_local : cb7210_return_to_local,
+static gpib_interface_t cb_pcmcia_accel_interface = {
+	.name = "cbi_pcmcia_accel",
+	.attach = cb_pcmcia_attach,
+	.detach = cb_pcmcia_detach,
+	.read = cb7210_accel_read,
+	.write = cb7210_accel_write,
+	.command = cb7210_command,
+	.take_control = cb7210_take_control,
+	.go_to_standby = cb7210_go_to_standby,
+	.request_system_control = cb7210_request_system_control,
+	.interface_clear = cb7210_interface_clear,
+	.remote_enable = cb7210_remote_enable,
+	.enable_eos = cb7210_enable_eos,
+	.disable_eos = cb7210_disable_eos,
+	.parallel_poll = cb7210_parallel_poll,
+	.parallel_poll_configure = cb7210_parallel_poll_configure,
+	.parallel_poll_response = cb7210_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = cb7210_line_status,
+	.update_status = cb7210_update_status,
+	.primary_address = cb7210_primary_address,
+	.secondary_address = cb7210_secondary_address,
+	.serial_poll_response = cb7210_serial_poll_response,
+	.serial_poll_status = cb7210_serial_poll_status,
+	.t1_delay = cb7210_t1_delay,
+	.return_to_local = cb7210_return_to_local,
 };
 
 int cb_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config)
diff --git a/drivers/staging/gpib/cec/cec.h b/drivers/staging/gpib/cec/cec.h
index 352cf83d8328..040ca70ed708 100644
--- a/drivers/staging/gpib/cec/cec.h
+++ b/drivers/staging/gpib/cec/cec.h
@@ -16,10 +16,6 @@ struct cec_priv  {
 	unsigned int irq;
 };
 
-// interfaces
-extern gpib_interface_t cec_pci_interface;
-extern gpib_interface_t cec_pcmcia_interface;
-
 // interface functions
 int cec_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end, size_t *bytes_read);
 int cec_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index e5b0941872f5..a72d79b9d7a4 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -182,32 +182,32 @@ void cec_return_to_local(gpib_board_t *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-gpib_interface_t cec_pci_interface = {
-name: "cec_pci",
-attach : cec_pci_attach,
-detach : cec_pci_detach,
-read : cec_read,
-write : cec_write,
-command : cec_command,
-take_control : cec_take_control,
-go_to_standby : cec_go_to_standby,
-request_system_control : cec_request_system_control,
-interface_clear : cec_interface_clear,
-remote_enable : cec_remote_enable,
-enable_eos : cec_enable_eos,
-disable_eos : cec_disable_eos,
-parallel_poll : cec_parallel_poll,
-parallel_poll_configure : cec_parallel_poll_configure,
-parallel_poll_response : cec_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : NULL,	//XXX
-update_status : cec_update_status,
-primary_address : cec_primary_address,
-secondary_address : cec_secondary_address,
-serial_poll_response : cec_serial_poll_response,
-serial_poll_status : cec_serial_poll_status,
-t1_delay : cec_t1_delay,
-return_to_local : cec_return_to_local,
+static gpib_interface_t cec_pci_interface = {
+	.name = "cec_pci",
+	.attach = cec_pci_attach,
+	.detach = cec_pci_detach,
+	.read = cec_read,
+	.write = cec_write,
+	.command = cec_command,
+	.take_control = cec_take_control,
+	.go_to_standby = cec_go_to_standby,
+	.request_system_control = cec_request_system_control,
+	.interface_clear = cec_interface_clear,
+	.remote_enable = cec_remote_enable,
+	.enable_eos = cec_enable_eos,
+	.disable_eos = cec_disable_eos,
+	.parallel_poll = cec_parallel_poll,
+	.parallel_poll_configure = cec_parallel_poll_configure,
+	.parallel_poll_response = cec_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = NULL,	//XXX
+	.update_status = cec_update_status,
+	.primary_address = cec_primary_address,
+	.secondary_address = cec_secondary_address,
+	.serial_poll_response = cec_serial_poll_response,
+	.serial_poll_status = cec_serial_poll_status,
+	.t1_delay = cec_t1_delay,
+	.return_to_local = cec_return_to_local,
 };
 
 static int cec_allocate_private(gpib_board_t *board)
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 875b3adcb584..df4855acac4a 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -720,31 +720,31 @@ static int fluke_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length,
 	return retval;
 }
 
-gpib_interface_t fluke_unaccel_interface = {
-name: "fluke_unaccel",
-attach : fluke_attach_holdoff_all,
-detach : fluke_detach,
-read : fluke_read,
-write : fluke_write,
-command : fluke_command,
-take_control : fluke_take_control,
-go_to_standby : fluke_go_to_standby,
-request_system_control : fluke_request_system_control,
-interface_clear : fluke_interface_clear,
-remote_enable : fluke_remote_enable,
-enable_eos : fluke_enable_eos,
-disable_eos : fluke_disable_eos,
-parallel_poll : fluke_parallel_poll,
-parallel_poll_configure : fluke_parallel_poll_configure,
-parallel_poll_response : fluke_parallel_poll_response,
-line_status : fluke_line_status,
-update_status : fluke_update_status,
-primary_address : fluke_primary_address,
-secondary_address : fluke_secondary_address,
-serial_poll_response : fluke_serial_poll_response,
-serial_poll_status : fluke_serial_poll_status,
-t1_delay : fluke_t1_delay,
-return_to_local : fluke_return_to_local,
+static gpib_interface_t fluke_unaccel_interface = {
+	.name = "fluke_unaccel",
+	.attach = fluke_attach_holdoff_all,
+	.detach = fluke_detach,
+	.read = fluke_read,
+	.write = fluke_write,
+	.command = fluke_command,
+	.take_control = fluke_take_control,
+	.go_to_standby = fluke_go_to_standby,
+	.request_system_control = fluke_request_system_control,
+	.interface_clear = fluke_interface_clear,
+	.remote_enable = fluke_remote_enable,
+	.enable_eos = fluke_enable_eos,
+	.disable_eos = fluke_disable_eos,
+	.parallel_poll = fluke_parallel_poll,
+	.parallel_poll_configure = fluke_parallel_poll_configure,
+	.parallel_poll_response = fluke_parallel_poll_response,
+	.line_status = fluke_line_status,
+	.update_status = fluke_update_status,
+	.primary_address = fluke_primary_address,
+	.secondary_address = fluke_secondary_address,
+	.serial_poll_response = fluke_serial_poll_response,
+	.serial_poll_status = fluke_serial_poll_status,
+	.t1_delay = fluke_t1_delay,
+	.return_to_local = fluke_return_to_local,
 };
 
 /* fluke_hybrid uses dma for writes but not for reads.  Added
@@ -755,58 +755,58 @@ return_to_local : fluke_return_to_local,
  * register just as the dma controller is also doing a read.
  */
 
-gpib_interface_t fluke_hybrid_interface = {
-name: "fluke_hybrid",
-attach : fluke_attach_holdoff_all,
-detach : fluke_detach,
-read : fluke_read,
-write : fluke_accel_write,
-command : fluke_command,
-take_control : fluke_take_control,
-go_to_standby : fluke_go_to_standby,
-request_system_control : fluke_request_system_control,
-interface_clear : fluke_interface_clear,
-remote_enable : fluke_remote_enable,
-enable_eos : fluke_enable_eos,
-disable_eos : fluke_disable_eos,
-parallel_poll : fluke_parallel_poll,
-parallel_poll_configure : fluke_parallel_poll_configure,
-parallel_poll_response : fluke_parallel_poll_response,
-line_status : fluke_line_status,
-update_status : fluke_update_status,
-primary_address : fluke_primary_address,
-secondary_address : fluke_secondary_address,
-serial_poll_response : fluke_serial_poll_response,
-serial_poll_status : fluke_serial_poll_status,
-t1_delay : fluke_t1_delay,
-return_to_local : fluke_return_to_local,
+static gpib_interface_t fluke_hybrid_interface = {
+	.name = "fluke_hybrid",
+	.attach = fluke_attach_holdoff_all,
+	.detach = fluke_detach,
+	.read = fluke_read,
+	.write = fluke_accel_write,
+	.command = fluke_command,
+	.take_control = fluke_take_control,
+	.go_to_standby = fluke_go_to_standby,
+	.request_system_control = fluke_request_system_control,
+	.interface_clear = fluke_interface_clear,
+	.remote_enable = fluke_remote_enable,
+	.enable_eos = fluke_enable_eos,
+	.disable_eos = fluke_disable_eos,
+	.parallel_poll = fluke_parallel_poll,
+	.parallel_poll_configure = fluke_parallel_poll_configure,
+	.parallel_poll_response = fluke_parallel_poll_response,
+	.line_status = fluke_line_status,
+	.update_status = fluke_update_status,
+	.primary_address = fluke_primary_address,
+	.secondary_address = fluke_secondary_address,
+	.serial_poll_response = fluke_serial_poll_response,
+	.serial_poll_status = fluke_serial_poll_status,
+	.t1_delay = fluke_t1_delay,
+	.return_to_local = fluke_return_to_local,
 };
 
-gpib_interface_t fluke_interface = {
-name: "fluke",
-attach : fluke_attach_holdoff_end,
-detach : fluke_detach,
-read : fluke_accel_read,
-write : fluke_accel_write,
-command : fluke_command,
-take_control : fluke_take_control,
-go_to_standby : fluke_go_to_standby,
-request_system_control : fluke_request_system_control,
-interface_clear : fluke_interface_clear,
-remote_enable : fluke_remote_enable,
-enable_eos : fluke_enable_eos,
-disable_eos : fluke_disable_eos,
-parallel_poll : fluke_parallel_poll,
-parallel_poll_configure : fluke_parallel_poll_configure,
-parallel_poll_response : fluke_parallel_poll_response,
-line_status : fluke_line_status,
-update_status : fluke_update_status,
-primary_address : fluke_primary_address,
-secondary_address : fluke_secondary_address,
-serial_poll_response : fluke_serial_poll_response,
-serial_poll_status : fluke_serial_poll_status,
-t1_delay : fluke_t1_delay,
-return_to_local : fluke_return_to_local,
+static gpib_interface_t fluke_interface = {
+	.name = "fluke",
+	.attach = fluke_attach_holdoff_end,
+	.detach = fluke_detach,
+	.read = fluke_accel_read,
+	.write = fluke_accel_write,
+	.command = fluke_command,
+	.take_control = fluke_take_control,
+	.go_to_standby = fluke_go_to_standby,
+	.request_system_control = fluke_request_system_control,
+	.interface_clear = fluke_interface_clear,
+	.remote_enable = fluke_remote_enable,
+	.enable_eos = fluke_enable_eos,
+	.disable_eos = fluke_disable_eos,
+	.parallel_poll = fluke_parallel_poll,
+	.parallel_poll_configure = fluke_parallel_poll_configure,
+	.parallel_poll_response = fluke_parallel_poll_response,
+	.line_status = fluke_line_status,
+	.update_status = fluke_update_status,
+	.primary_address = fluke_primary_address,
+	.secondary_address = fluke_secondary_address,
+	.serial_poll_response = fluke_serial_poll_response,
+	.serial_poll_status = fluke_serial_poll_status,
+	.t1_delay = fluke_t1_delay,
+	.return_to_local = fluke_return_to_local,
 };
 
 irqreturn_t fluke_gpib_internal_interrupt(gpib_board_t *board)
diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 90108ce0304a..fcef6e1aa618 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1038,116 +1038,116 @@ static int fmh_gpib_fifo_read(gpib_board_t *board, uint8_t *buffer, size_t lengt
 	return retval;
 }
 
-gpib_interface_t fmh_gpib_unaccel_interface = {
-name: "fmh_gpib_unaccel",
-attach : fmh_gpib_attach_holdoff_all,
-detach : fmh_gpib_detach,
-read : fmh_gpib_read,
-write : fmh_gpib_write,
-command : fmh_gpib_command,
-take_control : fmh_gpib_take_control,
-go_to_standby : fmh_gpib_go_to_standby,
-request_system_control : fmh_gpib_request_system_control,
-interface_clear : fmh_gpib_interface_clear,
-remote_enable : fmh_gpib_remote_enable,
-enable_eos : fmh_gpib_enable_eos,
-disable_eos : fmh_gpib_disable_eos,
-parallel_poll : fmh_gpib_parallel_poll,
-parallel_poll_configure : fmh_gpib_parallel_poll_configure,
-parallel_poll_response : fmh_gpib_parallel_poll_response,
-local_parallel_poll_mode : fmh_gpib_local_parallel_poll_mode,
-line_status : fmh_gpib_line_status,
-update_status : fmh_gpib_update_status,
-primary_address : fmh_gpib_primary_address,
-secondary_address : fmh_gpib_secondary_address,
-serial_poll_response2 : fmh_gpib_serial_poll_response2,
-serial_poll_status : fmh_gpib_serial_poll_status,
-t1_delay : fmh_gpib_t1_delay,
-return_to_local : fmh_gpib_return_to_local,
+static gpib_interface_t fmh_gpib_unaccel_interface = {
+	.name = "fmh_gpib_unaccel",
+	.attach = fmh_gpib_attach_holdoff_all,
+	.detach = fmh_gpib_detach,
+	.read = fmh_gpib_read,
+	.write = fmh_gpib_write,
+	.command = fmh_gpib_command,
+	.take_control = fmh_gpib_take_control,
+	.go_to_standby = fmh_gpib_go_to_standby,
+	.request_system_control = fmh_gpib_request_system_control,
+	.interface_clear = fmh_gpib_interface_clear,
+	.remote_enable = fmh_gpib_remote_enable,
+	.enable_eos = fmh_gpib_enable_eos,
+	.disable_eos = fmh_gpib_disable_eos,
+	.parallel_poll = fmh_gpib_parallel_poll,
+	.parallel_poll_configure = fmh_gpib_parallel_poll_configure,
+	.parallel_poll_response = fmh_gpib_parallel_poll_response,
+	.local_parallel_poll_mode = fmh_gpib_local_parallel_poll_mode,
+	.line_status = fmh_gpib_line_status,
+	.update_status = fmh_gpib_update_status,
+	.primary_address = fmh_gpib_primary_address,
+	.secondary_address = fmh_gpib_secondary_address,
+	.serial_poll_response2 = fmh_gpib_serial_poll_response2,
+	.serial_poll_status = fmh_gpib_serial_poll_status,
+	.t1_delay = fmh_gpib_t1_delay,
+	.return_to_local = fmh_gpib_return_to_local,
 };
 
-gpib_interface_t fmh_gpib_interface = {
-name: "fmh_gpib",
-attach : fmh_gpib_attach_holdoff_end,
-detach : fmh_gpib_detach,
-read : fmh_gpib_accel_read,
-write : fmh_gpib_accel_write,
-command : fmh_gpib_command,
-take_control : fmh_gpib_take_control,
-go_to_standby : fmh_gpib_go_to_standby,
-request_system_control : fmh_gpib_request_system_control,
-interface_clear : fmh_gpib_interface_clear,
-remote_enable : fmh_gpib_remote_enable,
-enable_eos : fmh_gpib_enable_eos,
-disable_eos : fmh_gpib_disable_eos,
-parallel_poll : fmh_gpib_parallel_poll,
-parallel_poll_configure : fmh_gpib_parallel_poll_configure,
-parallel_poll_response : fmh_gpib_parallel_poll_response,
-local_parallel_poll_mode : fmh_gpib_local_parallel_poll_mode,
-line_status : fmh_gpib_line_status,
-update_status : fmh_gpib_update_status,
-primary_address : fmh_gpib_primary_address,
-secondary_address : fmh_gpib_secondary_address,
-serial_poll_response2 : fmh_gpib_serial_poll_response2,
-serial_poll_status : fmh_gpib_serial_poll_status,
-t1_delay : fmh_gpib_t1_delay,
-return_to_local : fmh_gpib_return_to_local,
+static gpib_interface_t fmh_gpib_interface = {
+	.name = "fmh_gpib",
+	.attach = fmh_gpib_attach_holdoff_end,
+	.detach = fmh_gpib_detach,
+	.read = fmh_gpib_accel_read,
+	.write = fmh_gpib_accel_write,
+	.command = fmh_gpib_command,
+	.take_control = fmh_gpib_take_control,
+	.go_to_standby = fmh_gpib_go_to_standby,
+	.request_system_control = fmh_gpib_request_system_control,
+	.interface_clear = fmh_gpib_interface_clear,
+	.remote_enable = fmh_gpib_remote_enable,
+	.enable_eos = fmh_gpib_enable_eos,
+	.disable_eos = fmh_gpib_disable_eos,
+	.parallel_poll = fmh_gpib_parallel_poll,
+	.parallel_poll_configure = fmh_gpib_parallel_poll_configure,
+	.parallel_poll_response = fmh_gpib_parallel_poll_response,
+	.local_parallel_poll_mode = fmh_gpib_local_parallel_poll_mode,
+	.line_status = fmh_gpib_line_status,
+	.update_status = fmh_gpib_update_status,
+	.primary_address = fmh_gpib_primary_address,
+	.secondary_address = fmh_gpib_secondary_address,
+	.serial_poll_response2 = fmh_gpib_serial_poll_response2,
+	.serial_poll_status = fmh_gpib_serial_poll_status,
+	.t1_delay = fmh_gpib_t1_delay,
+	.return_to_local = fmh_gpib_return_to_local,
 };
 
-gpib_interface_t fmh_gpib_pci_interface = {
-name: "fmh_gpib_pci",
-attach : fmh_gpib_pci_attach_holdoff_end,
-detach : fmh_gpib_pci_detach,
-read : fmh_gpib_fifo_read,
-write : fmh_gpib_fifo_write,
-command : fmh_gpib_command,
-take_control : fmh_gpib_take_control,
-go_to_standby : fmh_gpib_go_to_standby,
-request_system_control : fmh_gpib_request_system_control,
-interface_clear : fmh_gpib_interface_clear,
-remote_enable : fmh_gpib_remote_enable,
-enable_eos : fmh_gpib_enable_eos,
-disable_eos : fmh_gpib_disable_eos,
-parallel_poll : fmh_gpib_parallel_poll,
-parallel_poll_configure : fmh_gpib_parallel_poll_configure,
-parallel_poll_response : fmh_gpib_parallel_poll_response,
-local_parallel_poll_mode : fmh_gpib_local_parallel_poll_mode,
-line_status : fmh_gpib_line_status,
-update_status : fmh_gpib_update_status,
-primary_address : fmh_gpib_primary_address,
-secondary_address : fmh_gpib_secondary_address,
-serial_poll_response2 : fmh_gpib_serial_poll_response2,
-serial_poll_status : fmh_gpib_serial_poll_status,
-t1_delay : fmh_gpib_t1_delay,
-return_to_local : fmh_gpib_return_to_local,
+static gpib_interface_t fmh_gpib_pci_interface = {
+	.name = "fmh_gpib_pci",
+	.attach = fmh_gpib_pci_attach_holdoff_end,
+	.detach = fmh_gpib_pci_detach,
+	.read = fmh_gpib_fifo_read,
+	.write = fmh_gpib_fifo_write,
+	.command = fmh_gpib_command,
+	.take_control = fmh_gpib_take_control,
+	.go_to_standby = fmh_gpib_go_to_standby,
+	.request_system_control = fmh_gpib_request_system_control,
+	.interface_clear = fmh_gpib_interface_clear,
+	.remote_enable = fmh_gpib_remote_enable,
+	.enable_eos = fmh_gpib_enable_eos,
+	.disable_eos = fmh_gpib_disable_eos,
+	.parallel_poll = fmh_gpib_parallel_poll,
+	.parallel_poll_configure = fmh_gpib_parallel_poll_configure,
+	.parallel_poll_response = fmh_gpib_parallel_poll_response,
+	.local_parallel_poll_mode = fmh_gpib_local_parallel_poll_mode,
+	.line_status = fmh_gpib_line_status,
+	.update_status = fmh_gpib_update_status,
+	.primary_address = fmh_gpib_primary_address,
+	.secondary_address = fmh_gpib_secondary_address,
+	.serial_poll_response2 = fmh_gpib_serial_poll_response2,
+	.serial_poll_status = fmh_gpib_serial_poll_status,
+	.t1_delay = fmh_gpib_t1_delay,
+	.return_to_local = fmh_gpib_return_to_local,
 };
 
-gpib_interface_t fmh_gpib_pci_unaccel_interface = {
-name: "fmh_gpib_pci_unaccel",
-attach : fmh_gpib_pci_attach_holdoff_all,
-detach : fmh_gpib_pci_detach,
-read : fmh_gpib_read,
-write : fmh_gpib_write,
-command : fmh_gpib_command,
-take_control : fmh_gpib_take_control,
-go_to_standby : fmh_gpib_go_to_standby,
-request_system_control : fmh_gpib_request_system_control,
-interface_clear : fmh_gpib_interface_clear,
-remote_enable : fmh_gpib_remote_enable,
-enable_eos : fmh_gpib_enable_eos,
-disable_eos : fmh_gpib_disable_eos,
-parallel_poll : fmh_gpib_parallel_poll,
-parallel_poll_configure : fmh_gpib_parallel_poll_configure,
-parallel_poll_response : fmh_gpib_parallel_poll_response,
-local_parallel_poll_mode : fmh_gpib_local_parallel_poll_mode,
-line_status : fmh_gpib_line_status,
-update_status : fmh_gpib_update_status,
-primary_address : fmh_gpib_primary_address,
-secondary_address : fmh_gpib_secondary_address,
-serial_poll_response2 : fmh_gpib_serial_poll_response2,
-serial_poll_status : fmh_gpib_serial_poll_status,
-t1_delay : fmh_gpib_t1_delay,
-return_to_local : fmh_gpib_return_to_local,
+static gpib_interface_t fmh_gpib_pci_unaccel_interface = {
+	.name = "fmh_gpib_pci_unaccel",
+	.attach = fmh_gpib_pci_attach_holdoff_all,
+	.detach = fmh_gpib_pci_detach,
+	.read = fmh_gpib_read,
+	.write = fmh_gpib_write,
+	.command = fmh_gpib_command,
+	.take_control = fmh_gpib_take_control,
+	.go_to_standby = fmh_gpib_go_to_standby,
+	.request_system_control = fmh_gpib_request_system_control,
+	.interface_clear = fmh_gpib_interface_clear,
+	.remote_enable = fmh_gpib_remote_enable,
+	.enable_eos = fmh_gpib_enable_eos,
+	.disable_eos = fmh_gpib_disable_eos,
+	.parallel_poll = fmh_gpib_parallel_poll,
+	.parallel_poll_configure = fmh_gpib_parallel_poll_configure,
+	.parallel_poll_response = fmh_gpib_parallel_poll_response,
+	.local_parallel_poll_mode = fmh_gpib_local_parallel_poll_mode,
+	.line_status = fmh_gpib_line_status,
+	.update_status = fmh_gpib_update_status,
+	.primary_address = fmh_gpib_primary_address,
+	.secondary_address = fmh_gpib_secondary_address,
+	.serial_poll_response2 = fmh_gpib_serial_poll_response2,
+	.serial_poll_status = fmh_gpib_serial_poll_status,
+	.t1_delay = fmh_gpib_t1_delay,
+	.return_to_local = fmh_gpib_return_to_local,
 };
 
 irqreturn_t fmh_gpib_internal_interrupt(gpib_board_t *board)
diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 057f9264de34..01c5b826ac47 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1312,31 +1312,31 @@ static int bb_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	return retval;
 }
 
-gpib_interface_t bb_interface = {
-name:			  NAME,
-attach : bb_attach,
-detach : bb_detach,
-read : bb_read,
-write : bb_write,
-command : bb_command,
-take_control : bb_take_control,
-go_to_standby : bb_go_to_standby,
-request_system_control : bb_request_system_control,
-interface_clear : bb_interface_clear,
-remote_enable : bb_remote_enable,
-enable_eos : bb_enable_eos,
-disable_eos : bb_disable_eos,
-parallel_poll : bb_parallel_poll,
-parallel_poll_configure : bb_parallel_poll_configure,
-parallel_poll_response : bb_parallel_poll_response,
-line_status : bb_line_status,
-update_status : bb_update_status,
-primary_address : bb_primary_address,
-secondary_address : bb_secondary_address,
-serial_poll_response : bb_serial_poll_response,
-serial_poll_status : bb_serial_poll_status,
-t1_delay : bb_t1_delay,
-return_to_local : bb_return_to_local,
+static gpib_interface_t bb_interface = {
+	.name =	NAME,
+	.attach = bb_attach,
+	.detach = bb_detach,
+	.read = bb_read,
+	.write = bb_write,
+	.command = bb_command,
+	.take_control = bb_take_control,
+	.go_to_standby = bb_go_to_standby,
+	.request_system_control = bb_request_system_control,
+	.interface_clear = bb_interface_clear,
+	.remote_enable = bb_remote_enable,
+	.enable_eos = bb_enable_eos,
+	.disable_eos = bb_disable_eos,
+	.parallel_poll = bb_parallel_poll,
+	.parallel_poll_configure = bb_parallel_poll_configure,
+	.parallel_poll_response = bb_parallel_poll_response,
+	.line_status = bb_line_status,
+	.update_status = bb_update_status,
+	.primary_address = bb_primary_address,
+	.secondary_address = bb_secondary_address,
+	.serial_poll_response = bb_serial_poll_response,
+	.serial_poll_status = bb_serial_poll_status,
+	.t1_delay = bb_t1_delay,
+	.return_to_local = bb_return_to_local,
 };
 
 static int __init bb_init_module(void)
diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 45157ad65d53..38dbda13a097 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -172,32 +172,32 @@ void hp82335_return_to_local(gpib_board_t *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-gpib_interface_t hp82335_interface = {
-name: "hp82335",
-attach : hp82335_attach,
-detach : hp82335_detach,
-read : hp82335_read,
-write : hp82335_write,
-command : hp82335_command,
-request_system_control : hp82335_request_system_control,
-take_control : hp82335_take_control,
-go_to_standby : hp82335_go_to_standby,
-interface_clear : hp82335_interface_clear,
-remote_enable : hp82335_remote_enable,
-enable_eos : hp82335_enable_eos,
-disable_eos : hp82335_disable_eos,
-parallel_poll : hp82335_parallel_poll,
-parallel_poll_configure : hp82335_parallel_poll_configure,
-parallel_poll_response : hp82335_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : hp82335_line_status,
-update_status : hp82335_update_status,
-primary_address : hp82335_primary_address,
-secondary_address : hp82335_secondary_address,
-serial_poll_response : hp82335_serial_poll_response,
-serial_poll_status : hp82335_serial_poll_status,
-t1_delay : hp82335_t1_delay,
-return_to_local : hp82335_return_to_local,
+static gpib_interface_t hp82335_interface = {
+	.name = "hp82335",
+	.attach = hp82335_attach,
+	.detach = hp82335_detach,
+	.read = hp82335_read,
+	.write = hp82335_write,
+	.command = hp82335_command,
+	.request_system_control = hp82335_request_system_control,
+	.take_control = hp82335_take_control,
+	.go_to_standby = hp82335_go_to_standby,
+	.interface_clear = hp82335_interface_clear,
+	.remote_enable = hp82335_remote_enable,
+	.enable_eos = hp82335_enable_eos,
+	.disable_eos = hp82335_disable_eos,
+	.parallel_poll = hp82335_parallel_poll,
+	.parallel_poll_configure = hp82335_parallel_poll_configure,
+	.parallel_poll_response = hp82335_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = hp82335_line_status,
+	.update_status = hp82335_update_status,
+	.primary_address = hp82335_primary_address,
+	.secondary_address = hp82335_secondary_address,
+	.serial_poll_response = hp82335_serial_poll_response,
+	.serial_poll_status = hp82335_serial_poll_status,
+	.t1_delay = hp82335_t1_delay,
+	.return_to_local = hp82335_return_to_local,
 };
 
 int hp82335_allocate_private(gpib_board_t *board)
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 4953dac1e177..da19470d5654 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -402,59 +402,59 @@ void hp_82341_return_to_local(gpib_board_t *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-gpib_interface_t hp_82341_unaccel_interface = {
-name: "hp_82341_unaccel",
-attach : hp_82341_attach,
-detach : hp_82341_detach,
-read : hp_82341_read,
-write : hp_82341_write,
-command : hp_82341_command,
-request_system_control : hp_82341_request_system_control,
-take_control : hp_82341_take_control,
-go_to_standby : hp_82341_go_to_standby,
-interface_clear : hp_82341_interface_clear,
-remote_enable : hp_82341_remote_enable,
-enable_eos : hp_82341_enable_eos,
-disable_eos : hp_82341_disable_eos,
-parallel_poll : hp_82341_parallel_poll,
-parallel_poll_configure : hp_82341_parallel_poll_configure,
-parallel_poll_response : hp_82341_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : hp_82341_line_status,
-update_status : hp_82341_update_status,
-primary_address : hp_82341_primary_address,
-secondary_address : hp_82341_secondary_address,
-serial_poll_response : hp_82341_serial_poll_response,
-serial_poll_status : hp_82341_serial_poll_status,
-t1_delay : hp_82341_t1_delay,
-return_to_local : hp_82341_return_to_local,
+static gpib_interface_t hp_82341_unaccel_interface = {
+	.name = "hp_82341_unaccel",
+	.attach = hp_82341_attach,
+	.detach = hp_82341_detach,
+	.read = hp_82341_read,
+	.write = hp_82341_write,
+	.command = hp_82341_command,
+	.request_system_control = hp_82341_request_system_control,
+	.take_control = hp_82341_take_control,
+	.go_to_standby = hp_82341_go_to_standby,
+	.interface_clear = hp_82341_interface_clear,
+	.remote_enable = hp_82341_remote_enable,
+	.enable_eos = hp_82341_enable_eos,
+	.disable_eos = hp_82341_disable_eos,
+	.parallel_poll = hp_82341_parallel_poll,
+	.parallel_poll_configure = hp_82341_parallel_poll_configure,
+	.parallel_poll_response = hp_82341_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = hp_82341_line_status,
+	.update_status = hp_82341_update_status,
+	.primary_address = hp_82341_primary_address,
+	.secondary_address = hp_82341_secondary_address,
+	.serial_poll_response = hp_82341_serial_poll_response,
+	.serial_poll_status = hp_82341_serial_poll_status,
+	.t1_delay = hp_82341_t1_delay,
+	.return_to_local = hp_82341_return_to_local,
 };
 
-gpib_interface_t hp_82341_interface = {
-name: "hp_82341",
-attach : hp_82341_attach,
-detach : hp_82341_detach,
-read : hp_82341_accel_read,
-write : hp_82341_accel_write,
-command : hp_82341_command,
-request_system_control : hp_82341_request_system_control,
-take_control : hp_82341_take_control,
-go_to_standby : hp_82341_go_to_standby,
-interface_clear : hp_82341_interface_clear,
-remote_enable : hp_82341_remote_enable,
-enable_eos : hp_82341_enable_eos,
-disable_eos : hp_82341_disable_eos,
-parallel_poll : hp_82341_parallel_poll,
-parallel_poll_configure : hp_82341_parallel_poll_configure,
-parallel_poll_response : hp_82341_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : hp_82341_line_status,
-update_status : hp_82341_update_status,
-primary_address : hp_82341_primary_address,
-secondary_address : hp_82341_secondary_address,
-serial_poll_response : hp_82341_serial_poll_response,
-t1_delay : hp_82341_t1_delay,
-return_to_local : hp_82341_return_to_local,
+static gpib_interface_t hp_82341_interface = {
+	.name = "hp_82341",
+	.attach = hp_82341_attach,
+	.detach = hp_82341_detach,
+	.read = hp_82341_accel_read,
+	.write = hp_82341_accel_write,
+	.command = hp_82341_command,
+	.request_system_control = hp_82341_request_system_control,
+	.take_control = hp_82341_take_control,
+	.go_to_standby = hp_82341_go_to_standby,
+	.interface_clear = hp_82341_interface_clear,
+	.remote_enable = hp_82341_remote_enable,
+	.enable_eos = hp_82341_enable_eos,
+	.disable_eos = hp_82341_disable_eos,
+	.parallel_poll = hp_82341_parallel_poll,
+	.parallel_poll_configure = hp_82341_parallel_poll_configure,
+	.parallel_poll_response = hp_82341_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = hp_82341_line_status,
+	.update_status = hp_82341_update_status,
+	.primary_address = hp_82341_primary_address,
+	.secondary_address = hp_82341_secondary_address,
+	.serial_poll_response = hp_82341_serial_poll_response,
+	.t1_delay = hp_82341_t1_delay,
+	.return_to_local = hp_82341_return_to_local,
 };
 
 int hp_82341_allocate_private(gpib_board_t *board)
diff --git a/drivers/staging/gpib/ines/ines.h b/drivers/staging/gpib/ines/ines.h
index 7e8302619998..4e243d7951af 100644
--- a/drivers/staging/gpib/ines/ines.h
+++ b/drivers/staging/gpib/ines/ines.h
@@ -35,13 +35,6 @@ struct ines_priv {
 	u8 extend_mode_bits;
 };
 
-// interfaces
-extern gpib_interface_t ines_pci_interface;
-extern gpib_interface_t ines_pci_accel_interface;
-extern gpib_interface_t ines_pcmcia_interface;
-extern gpib_interface_t ines_pcmcia_accel_interface;
-extern gpib_interface_t ines_pcmcia_unaccel_interface;
-
 // interface functions
 int ines_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end, size_t *bytes_read);
 int ines_write(gpib_board_t *board, uint8_t *buffer, size_t length,
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 9d4bbb8e8a75..583e73759634 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -540,116 +540,116 @@ void ines_return_to_local(gpib_board_t *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-gpib_interface_t ines_pci_unaccel_interface = {
-name: "ines_pci_unaccel",
-attach : ines_pci_attach,
-detach : ines_pci_detach,
-read : ines_read,
-write : ines_write,
-command : ines_command,
-take_control : ines_take_control,
-go_to_standby : ines_go_to_standby,
-request_system_control : ines_request_system_control,
-interface_clear : ines_interface_clear,
-remote_enable : ines_remote_enable,
-enable_eos : ines_enable_eos,
-disable_eos : ines_disable_eos,
-parallel_poll : ines_parallel_poll,
-parallel_poll_configure : ines_parallel_poll_configure,
-parallel_poll_response : ines_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : ines_line_status,
-update_status : ines_update_status,
-primary_address : ines_primary_address,
-secondary_address : ines_secondary_address,
-serial_poll_response : ines_serial_poll_response,
-serial_poll_status : ines_serial_poll_status,
-t1_delay : ines_t1_delay,
-return_to_local : ines_return_to_local,
+static gpib_interface_t ines_pci_unaccel_interface = {
+	.name = "ines_pci_unaccel",
+	.attach = ines_pci_attach,
+	.detach = ines_pci_detach,
+	.read = ines_read,
+	.write = ines_write,
+	.command = ines_command,
+	.take_control = ines_take_control,
+	.go_to_standby = ines_go_to_standby,
+	.request_system_control = ines_request_system_control,
+	.interface_clear = ines_interface_clear,
+	.remote_enable = ines_remote_enable,
+	.enable_eos = ines_enable_eos,
+	.disable_eos = ines_disable_eos,
+	.parallel_poll = ines_parallel_poll,
+	.parallel_poll_configure = ines_parallel_poll_configure,
+	.parallel_poll_response = ines_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = ines_line_status,
+	.update_status = ines_update_status,
+	.primary_address = ines_primary_address,
+	.secondary_address = ines_secondary_address,
+	.serial_poll_response = ines_serial_poll_response,
+	.serial_poll_status = ines_serial_poll_status,
+	.t1_delay = ines_t1_delay,
+	.return_to_local = ines_return_to_local,
 };
 
-gpib_interface_t ines_pci_interface = {
-name: "ines_pci",
-attach : ines_pci_accel_attach,
-detach : ines_pci_detach,
-read : ines_accel_read,
-write : ines_accel_write,
-command : ines_command,
-take_control : ines_take_control,
-go_to_standby : ines_go_to_standby,
-request_system_control : ines_request_system_control,
-interface_clear : ines_interface_clear,
-remote_enable : ines_remote_enable,
-enable_eos : ines_enable_eos,
-disable_eos : ines_disable_eos,
-parallel_poll : ines_parallel_poll,
-parallel_poll_configure : ines_parallel_poll_configure,
-parallel_poll_response : ines_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : ines_line_status,
-update_status : ines_update_status,
-primary_address : ines_primary_address,
-secondary_address : ines_secondary_address,
-serial_poll_response : ines_serial_poll_response,
-serial_poll_status : ines_serial_poll_status,
-t1_delay : ines_t1_delay,
-return_to_local : ines_return_to_local,
+static gpib_interface_t ines_pci_interface = {
+	.name = "ines_pci",
+	.attach = ines_pci_accel_attach,
+	.detach = ines_pci_detach,
+	.read = ines_accel_read,
+	.write = ines_accel_write,
+	.command = ines_command,
+	.take_control = ines_take_control,
+	.go_to_standby = ines_go_to_standby,
+	.request_system_control = ines_request_system_control,
+	.interface_clear = ines_interface_clear,
+	.remote_enable = ines_remote_enable,
+	.enable_eos = ines_enable_eos,
+	.disable_eos = ines_disable_eos,
+	.parallel_poll = ines_parallel_poll,
+	.parallel_poll_configure = ines_parallel_poll_configure,
+	.parallel_poll_response = ines_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = ines_line_status,
+	.update_status = ines_update_status,
+	.primary_address = ines_primary_address,
+	.secondary_address = ines_secondary_address,
+	.serial_poll_response = ines_serial_poll_response,
+	.serial_poll_status = ines_serial_poll_status,
+	.t1_delay = ines_t1_delay,
+	.return_to_local = ines_return_to_local,
 };
 
-gpib_interface_t ines_pci_accel_interface = {
-name: "ines_pci_accel",
-attach : ines_pci_accel_attach,
-detach : ines_pci_detach,
-read : ines_accel_read,
-write : ines_accel_write,
-command : ines_command,
-take_control : ines_take_control,
-go_to_standby : ines_go_to_standby,
-request_system_control : ines_request_system_control,
-interface_clear : ines_interface_clear,
-remote_enable : ines_remote_enable,
-enable_eos : ines_enable_eos,
-disable_eos : ines_disable_eos,
-parallel_poll : ines_parallel_poll,
-parallel_poll_configure : ines_parallel_poll_configure,
-parallel_poll_response : ines_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : ines_line_status,
-update_status : ines_update_status,
-primary_address : ines_primary_address,
-secondary_address : ines_secondary_address,
-serial_poll_response : ines_serial_poll_response,
-serial_poll_status : ines_serial_poll_status,
-t1_delay : ines_t1_delay,
-return_to_local : ines_return_to_local,
+static gpib_interface_t ines_pci_accel_interface = {
+	.name = "ines_pci_accel",
+	.attach = ines_pci_accel_attach,
+	.detach = ines_pci_detach,
+	.read = ines_accel_read,
+	.write = ines_accel_write,
+	.command = ines_command,
+	.take_control = ines_take_control,
+	.go_to_standby = ines_go_to_standby,
+	.request_system_control = ines_request_system_control,
+	.interface_clear = ines_interface_clear,
+	.remote_enable = ines_remote_enable,
+	.enable_eos = ines_enable_eos,
+	.disable_eos = ines_disable_eos,
+	.parallel_poll = ines_parallel_poll,
+	.parallel_poll_configure = ines_parallel_poll_configure,
+	.parallel_poll_response = ines_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = ines_line_status,
+	.update_status = ines_update_status,
+	.primary_address = ines_primary_address,
+	.secondary_address = ines_secondary_address,
+	.serial_poll_response = ines_serial_poll_response,
+	.serial_poll_status = ines_serial_poll_status,
+	.t1_delay = ines_t1_delay,
+	.return_to_local = ines_return_to_local,
 };
 
-gpib_interface_t ines_isa_interface = {
-name: "ines_isa",
-attach : ines_isa_attach,
-detach : ines_isa_detach,
-read : ines_accel_read,
-write : ines_accel_write,
-command : ines_command,
-take_control : ines_take_control,
-go_to_standby : ines_go_to_standby,
-request_system_control : ines_request_system_control,
-interface_clear : ines_interface_clear,
-remote_enable : ines_remote_enable,
-enable_eos : ines_enable_eos,
-disable_eos : ines_disable_eos,
-parallel_poll : ines_parallel_poll,
-parallel_poll_configure : ines_parallel_poll_configure,
-parallel_poll_response : ines_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : ines_line_status,
-update_status : ines_update_status,
-primary_address : ines_primary_address,
-secondary_address : ines_secondary_address,
-serial_poll_response : ines_serial_poll_response,
-serial_poll_status : ines_serial_poll_status,
-t1_delay : ines_t1_delay,
-return_to_local : ines_return_to_local,
+static gpib_interface_t ines_isa_interface = {
+	.name = "ines_isa",
+	.attach = ines_isa_attach,
+	.detach = ines_isa_detach,
+	.read = ines_accel_read,
+	.write = ines_accel_write,
+	.command = ines_command,
+	.take_control = ines_take_control,
+	.go_to_standby = ines_go_to_standby,
+	.request_system_control = ines_request_system_control,
+	.interface_clear = ines_interface_clear,
+	.remote_enable = ines_remote_enable,
+	.enable_eos = ines_enable_eos,
+	.disable_eos = ines_disable_eos,
+	.parallel_poll = ines_parallel_poll,
+	.parallel_poll_configure = ines_parallel_poll_configure,
+	.parallel_poll_response = ines_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = ines_line_status,
+	.update_status = ines_update_status,
+	.primary_address = ines_primary_address,
+	.secondary_address = ines_secondary_address,
+	.serial_poll_response = ines_serial_poll_response,
+	.serial_poll_status = ines_serial_poll_status,
+	.t1_delay = ines_t1_delay,
+	.return_to_local = ines_return_to_local,
 };
 
 static int ines_allocate_private(gpib_board_t *board)
diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 69cf4cb284f9..d91def4baa09 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1131,33 +1131,33 @@ static unsigned int usb_gpib_t1_delay(gpib_board_t *board, unsigned int nano_sec
  *   ***  module dispatch table and init/exit functions	 ***
  */
 
-gpib_interface_t usb_gpib_interface = {
-name: NAME,
-attach : usb_gpib_attach,
-detach : usb_gpib_detach,
-read : usb_gpib_read,
-write : usb_gpib_write,
-command : usb_gpib_command,
-take_control : usb_gpib_take_control,
-go_to_standby : usb_gpib_go_to_standby,
-request_system_control : usb_gpib_request_system_control,
-interface_clear : usb_gpib_interface_clear,
-remote_enable : usb_gpib_remote_enable,
-enable_eos : usb_gpib_enable_eos,
-disable_eos : usb_gpib_disable_eos,
-parallel_poll : usb_gpib_parallel_poll,
-parallel_poll_configure : usb_gpib_parallel_poll_configure,
-parallel_poll_response : usb_gpib_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : usb_gpib_line_status,
-update_status : usb_gpib_update_status,
-primary_address : usb_gpib_primary_address,
-secondary_address : usb_gpib_secondary_address,
-serial_poll_response : usb_gpib_serial_poll_response,
-serial_poll_status : usb_gpib_serial_poll_status,
-t1_delay : usb_gpib_t1_delay,
-return_to_local : usb_gpib_return_to_local,
-skip_check_for_command_acceptors : 1
+static gpib_interface_t usb_gpib_interface = {
+	.name = NAME,
+	.attach = usb_gpib_attach,
+	.detach = usb_gpib_detach,
+	.read = usb_gpib_read,
+	.write = usb_gpib_write,
+	.command = usb_gpib_command,
+	.take_control = usb_gpib_take_control,
+	.go_to_standby = usb_gpib_go_to_standby,
+	.request_system_control = usb_gpib_request_system_control,
+	.interface_clear = usb_gpib_interface_clear,
+	.remote_enable = usb_gpib_remote_enable,
+	.enable_eos = usb_gpib_enable_eos,
+	.disable_eos = usb_gpib_disable_eos,
+	.parallel_poll = usb_gpib_parallel_poll,
+	.parallel_poll_configure = usb_gpib_parallel_poll_configure,
+	.parallel_poll_response = usb_gpib_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = usb_gpib_line_status,
+	.update_status = usb_gpib_update_status,
+	.primary_address = usb_gpib_primary_address,
+	.secondary_address = usb_gpib_secondary_address,
+	.serial_poll_response = usb_gpib_serial_poll_response,
+	.serial_poll_status = usb_gpib_serial_poll_status,
+	.t1_delay = usb_gpib_t1_delay,
+	.return_to_local = usb_gpib_return_to_local,
+	.skip_check_for_command_acceptors = 1
 };
 
 /*
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 3c4132fd6de9..2c0a0d7e36c6 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -2351,33 +2351,33 @@ static void ni_usb_detach(gpib_board_t *board)
 	mutex_unlock(&ni_usb_hotplug_lock);
 }
 
-gpib_interface_t ni_usb_gpib_interface = {
-name: "ni_usb_b",
-attach : ni_usb_attach,
-detach : ni_usb_detach,
-read : ni_usb_read,
-write : ni_usb_write,
-command : ni_usb_command,
-take_control : ni_usb_take_control,
-go_to_standby : ni_usb_go_to_standby,
-request_system_control : ni_usb_request_system_control,
-interface_clear : ni_usb_interface_clear,
-remote_enable : ni_usb_remote_enable,
-enable_eos : ni_usb_enable_eos,
-disable_eos : ni_usb_disable_eos,
-parallel_poll : ni_usb_parallel_poll,
-parallel_poll_configure : ni_usb_parallel_poll_configure,
-parallel_poll_response : ni_usb_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : ni_usb_line_status,
-update_status : ni_usb_update_status,
-primary_address : ni_usb_primary_address,
-secondary_address : ni_usb_secondary_address,
-serial_poll_response : ni_usb_serial_poll_response,
-serial_poll_status : ni_usb_serial_poll_status,
-t1_delay : ni_usb_t1_delay,
-return_to_local : ni_usb_return_to_local,
-skip_check_for_command_acceptors : 1
+static gpib_interface_t ni_usb_gpib_interface = {
+	.name = "ni_usb_b",
+	.attach = ni_usb_attach,
+	.detach = ni_usb_detach,
+	.read = ni_usb_read,
+	.write = ni_usb_write,
+	.command = ni_usb_command,
+	.take_control = ni_usb_take_control,
+	.go_to_standby = ni_usb_go_to_standby,
+	.request_system_control = ni_usb_request_system_control,
+	.interface_clear = ni_usb_interface_clear,
+	.remote_enable = ni_usb_remote_enable,
+	.enable_eos = ni_usb_enable_eos,
+	.disable_eos = ni_usb_disable_eos,
+	.parallel_poll = ni_usb_parallel_poll,
+	.parallel_poll_configure = ni_usb_parallel_poll_configure,
+	.parallel_poll_response = ni_usb_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = ni_usb_line_status,
+	.update_status = ni_usb_update_status,
+	.primary_address = ni_usb_primary_address,
+	.secondary_address = ni_usb_secondary_address,
+	.serial_poll_response = ni_usb_serial_poll_response,
+	.serial_poll_status = ni_usb_serial_poll_status,
+	.t1_delay = ni_usb_t1_delay,
+	.return_to_local = ni_usb_return_to_local,
+	.skip_check_for_command_acceptors = 1
 };
 
 // Table with the USB-devices: just now only testing IDs
diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index a9aae563f60a..ee0eca59a934 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -238,116 +238,116 @@ static void pc2_return_to_local(gpib_board_t *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-gpib_interface_t pc2_interface = {
-name:	"pcII",
-attach :	pc2_attach,
-detach :	pc2_detach,
-read :	pc2_read,
-write :	pc2_write,
-command :	pc2_command,
-take_control :	pc2_take_control,
-go_to_standby :	pc2_go_to_standby,
-request_system_control :	pc2_request_system_control,
-interface_clear :	pc2_interface_clear,
-remote_enable :	pc2_remote_enable,
-enable_eos :	pc2_enable_eos,
-disable_eos :	pc2_disable_eos,
-parallel_poll :	pc2_parallel_poll,
-parallel_poll_configure :	pc2_parallel_poll_configure,
-parallel_poll_response :	pc2_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status :	NULL,
-update_status :	pc2_update_status,
-primary_address :	pc2_primary_address,
-secondary_address :	pc2_secondary_address,
-serial_poll_response :	pc2_serial_poll_response,
-serial_poll_status :	pc2_serial_poll_status,
-t1_delay : pc2_t1_delay,
-return_to_local : pc2_return_to_local,
+static gpib_interface_t pc2_interface = {
+	.name =	"pcII",
+	.attach =	pc2_attach,
+	.detach =	pc2_detach,
+	.read =	pc2_read,
+	.write =	pc2_write,
+	.command =	pc2_command,
+	.take_control =	pc2_take_control,
+	.go_to_standby =	pc2_go_to_standby,
+	.request_system_control =	pc2_request_system_control,
+	.interface_clear =	pc2_interface_clear,
+	.remote_enable =	pc2_remote_enable,
+	.enable_eos =	pc2_enable_eos,
+	.disable_eos =	pc2_disable_eos,
+	.parallel_poll =	pc2_parallel_poll,
+	.parallel_poll_configure =	pc2_parallel_poll_configure,
+	.parallel_poll_response =	pc2_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status =	NULL,
+	.update_status =	pc2_update_status,
+	.primary_address =	pc2_primary_address,
+	.secondary_address =	pc2_secondary_address,
+	.serial_poll_response =	pc2_serial_poll_response,
+	.serial_poll_status =	pc2_serial_poll_status,
+	.t1_delay = pc2_t1_delay,
+	.return_to_local = pc2_return_to_local,
 };
 
-gpib_interface_t pc2a_interface = {
-name:	"pcIIa",
-attach :	pc2a_attach,
-detach :	pc2a_detach,
-read :	pc2_read,
-write :	pc2_write,
-command :	pc2_command,
-take_control :	pc2_take_control,
-go_to_standby :	pc2_go_to_standby,
-request_system_control :	pc2_request_system_control,
-interface_clear :	pc2_interface_clear,
-remote_enable :	pc2_remote_enable,
-enable_eos :	pc2_enable_eos,
-disable_eos :	pc2_disable_eos,
-parallel_poll :	pc2_parallel_poll,
-parallel_poll_configure :	pc2_parallel_poll_configure,
-parallel_poll_response :	pc2_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status :	NULL,
-update_status :	pc2_update_status,
-primary_address :	pc2_primary_address,
-secondary_address :	pc2_secondary_address,
-serial_poll_response :	pc2_serial_poll_response,
-serial_poll_status :	pc2_serial_poll_status,
-t1_delay : pc2_t1_delay,
-return_to_local : pc2_return_to_local,
+static gpib_interface_t pc2a_interface = {
+	.name =	"pcIIa",
+	.attach =	pc2a_attach,
+	.detach =	pc2a_detach,
+	.read =	pc2_read,
+	.write =	pc2_write,
+	.command =	pc2_command,
+	.take_control =	pc2_take_control,
+	.go_to_standby =	pc2_go_to_standby,
+	.request_system_control =	pc2_request_system_control,
+	.interface_clear =	pc2_interface_clear,
+	.remote_enable =	pc2_remote_enable,
+	.enable_eos =	pc2_enable_eos,
+	.disable_eos =	pc2_disable_eos,
+	.parallel_poll =	pc2_parallel_poll,
+	.parallel_poll_configure =	pc2_parallel_poll_configure,
+	.parallel_poll_response =	pc2_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status =	NULL,
+	.update_status =	pc2_update_status,
+	.primary_address =	pc2_primary_address,
+	.secondary_address =	pc2_secondary_address,
+	.serial_poll_response =	pc2_serial_poll_response,
+	.serial_poll_status =	pc2_serial_poll_status,
+	.t1_delay = pc2_t1_delay,
+	.return_to_local = pc2_return_to_local,
 };
 
-gpib_interface_t pc2a_cb7210_interface = {
-name:	"pcIIa_cb7210",
-attach :	pc2a_cb7210_attach,
-detach :	pc2a_detach,
-read :	pc2_read,
-write :	pc2_write,
-command :	pc2_command,
-take_control :	pc2_take_control,
-go_to_standby :	pc2_go_to_standby,
-request_system_control :	pc2_request_system_control,
-interface_clear :	pc2_interface_clear,
-remote_enable :	pc2_remote_enable,
-enable_eos :	pc2_enable_eos,
-disable_eos :	pc2_disable_eos,
-parallel_poll :	pc2_parallel_poll,
-parallel_poll_configure :	pc2_parallel_poll_configure,
-parallel_poll_response :	pc2_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status :	NULL, //XXX
-update_status :	pc2_update_status,
-primary_address :	pc2_primary_address,
-secondary_address :	pc2_secondary_address,
-serial_poll_response :	pc2_serial_poll_response,
-serial_poll_status :	pc2_serial_poll_status,
-t1_delay : pc2_t1_delay,
-return_to_local : pc2_return_to_local,
+static gpib_interface_t pc2a_cb7210_interface = {
+	.name =	"pcIIa_cb7210",
+	.attach =	pc2a_cb7210_attach,
+	.detach =	pc2a_detach,
+	.read =	pc2_read,
+	.write =	pc2_write,
+	.command =	pc2_command,
+	.take_control =	pc2_take_control,
+	.go_to_standby =	pc2_go_to_standby,
+	.request_system_control =	pc2_request_system_control,
+	.interface_clear =	pc2_interface_clear,
+	.remote_enable =	pc2_remote_enable,
+	.enable_eos =	pc2_enable_eos,
+	.disable_eos =	pc2_disable_eos,
+	.parallel_poll =	pc2_parallel_poll,
+	.parallel_poll_configure =	pc2_parallel_poll_configure,
+	.parallel_poll_response =	pc2_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status =	NULL, //XXX
+	.update_status =	pc2_update_status,
+	.primary_address =	pc2_primary_address,
+	.secondary_address =	pc2_secondary_address,
+	.serial_poll_response =	pc2_serial_poll_response,
+	.serial_poll_status =	pc2_serial_poll_status,
+	.t1_delay = pc2_t1_delay,
+	.return_to_local = pc2_return_to_local,
 };
 
-gpib_interface_t pc2_2a_interface = {
-name:	"pcII_IIa",
-attach :	pc2_2a_attach,
-detach :	pc2_2a_detach,
-read :	pc2_read,
-write :	pc2_write,
-command :	pc2_command,
-take_control :	pc2_take_control,
-go_to_standby :	pc2_go_to_standby,
-request_system_control :	pc2_request_system_control,
-interface_clear :	pc2_interface_clear,
-remote_enable :	pc2_remote_enable,
-enable_eos :	pc2_enable_eos,
-disable_eos :	pc2_disable_eos,
-parallel_poll :	pc2_parallel_poll,
-parallel_poll_configure :	pc2_parallel_poll_configure,
-parallel_poll_response :	pc2_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status :	NULL,
-update_status :	pc2_update_status,
-primary_address :	pc2_primary_address,
-secondary_address :	pc2_secondary_address,
-serial_poll_response :	pc2_serial_poll_response,
-serial_poll_status :	pc2_serial_poll_status,
-t1_delay : pc2_t1_delay,
-return_to_local : pc2_return_to_local,
+static gpib_interface_t pc2_2a_interface = {
+	.name =	"pcII_IIa",
+	.attach =	pc2_2a_attach,
+	.detach =	pc2_2a_detach,
+	.read =	pc2_read,
+	.write =	pc2_write,
+	.command =	pc2_command,
+	.take_control =	pc2_take_control,
+	.go_to_standby =	pc2_go_to_standby,
+	.request_system_control =	pc2_request_system_control,
+	.interface_clear =	pc2_interface_clear,
+	.remote_enable =	pc2_remote_enable,
+	.enable_eos =	pc2_enable_eos,
+	.disable_eos =	pc2_disable_eos,
+	.parallel_poll =	pc2_parallel_poll,
+	.parallel_poll_configure =	pc2_parallel_poll_configure,
+	.parallel_poll_response =	pc2_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status =	NULL,
+	.update_status =	pc2_update_status,
+	.primary_address =	pc2_primary_address,
+	.secondary_address =	pc2_secondary_address,
+	.serial_poll_response =	pc2_serial_poll_response,
+	.serial_poll_status =	pc2_serial_poll_status,
+	.t1_delay = pc2_t1_delay,
+	.return_to_local = pc2_return_to_local,
 };
 
 static int allocate_private(gpib_board_t *board)
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index a2549231525b..1b0d4fdf28cf 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -894,285 +894,285 @@ void tnt4882_return_to_local(gpib_board_t *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-gpib_interface_t ni_pci_interface = {
-name: "ni_pci",
-attach :  ni_pci_attach,
-detach :  ni_pci_detach,
-read :  tnt4882_accel_read,
-write : tnt4882_accel_write,
-command : tnt4882_command,
-take_control : tnt4882_take_control,
-go_to_standby : tnt4882_go_to_standby,
-request_system_control : tnt4882_request_system_control,
-interface_clear : tnt4882_interface_clear,
-remote_enable : tnt4882_remote_enable,
-enable_eos : tnt4882_enable_eos,
-disable_eos : tnt4882_disable_eos,
-parallel_poll : tnt4882_parallel_poll,
-parallel_poll_configure : tnt4882_parallel_poll_configure,
-parallel_poll_response : tnt4882_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : tnt4882_line_status,
-update_status : tnt4882_update_status,
-primary_address : tnt4882_primary_address,
-secondary_address : tnt4882_secondary_address,
-serial_poll_response2 : tnt4882_serial_poll_response2,
-serial_poll_status : tnt4882_serial_poll_status,
-t1_delay : tnt4882_t1_delay,
-return_to_local : tnt4882_return_to_local,
+static gpib_interface_t ni_pci_interface = {
+	.name = "ni_pci",
+	.attach = ni_pci_attach,
+	.detach = ni_pci_detach,
+	.read = tnt4882_accel_read,
+	.write = tnt4882_accel_write,
+	.command = tnt4882_command,
+	.take_control = tnt4882_take_control,
+	.go_to_standby = tnt4882_go_to_standby,
+	.request_system_control = tnt4882_request_system_control,
+	.interface_clear = tnt4882_interface_clear,
+	.remote_enable = tnt4882_remote_enable,
+	.enable_eos = tnt4882_enable_eos,
+	.disable_eos = tnt4882_disable_eos,
+	.parallel_poll = tnt4882_parallel_poll,
+	.parallel_poll_configure = tnt4882_parallel_poll_configure,
+	.parallel_poll_response = tnt4882_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = tnt4882_line_status,
+	.update_status = tnt4882_update_status,
+	.primary_address = tnt4882_primary_address,
+	.secondary_address = tnt4882_secondary_address,
+	.serial_poll_response2 = tnt4882_serial_poll_response2,
+	.serial_poll_status = tnt4882_serial_poll_status,
+	.t1_delay = tnt4882_t1_delay,
+	.return_to_local = tnt4882_return_to_local,
 };
 
-gpib_interface_t ni_pci_accel_interface = {
-name: "ni_pci_accel",
-attach : ni_pci_attach,
-detach : ni_pci_detach,
-read : tnt4882_accel_read,
-write : tnt4882_accel_write,
-command : tnt4882_command,
-take_control : tnt4882_take_control,
-go_to_standby : tnt4882_go_to_standby,
-request_system_control : tnt4882_request_system_control,
-interface_clear : tnt4882_interface_clear,
-remote_enable : tnt4882_remote_enable,
-enable_eos : tnt4882_enable_eos,
-disable_eos : tnt4882_disable_eos,
-parallel_poll : tnt4882_parallel_poll,
-parallel_poll_configure : tnt4882_parallel_poll_configure,
-parallel_poll_response : tnt4882_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : tnt4882_line_status,
-update_status : tnt4882_update_status,
-primary_address : tnt4882_primary_address,
-secondary_address : tnt4882_secondary_address,
-serial_poll_response2 : tnt4882_serial_poll_response2,
-serial_poll_status : tnt4882_serial_poll_status,
-t1_delay : tnt4882_t1_delay,
-return_to_local : tnt4882_return_to_local,
+static gpib_interface_t ni_pci_accel_interface = {
+	.name = "ni_pci_accel",
+	.attach = ni_pci_attach,
+	.detach = ni_pci_detach,
+	.read = tnt4882_accel_read,
+	.write = tnt4882_accel_write,
+	.command = tnt4882_command,
+	.take_control = tnt4882_take_control,
+	.go_to_standby = tnt4882_go_to_standby,
+	.request_system_control = tnt4882_request_system_control,
+	.interface_clear = tnt4882_interface_clear,
+	.remote_enable = tnt4882_remote_enable,
+	.enable_eos = tnt4882_enable_eos,
+	.disable_eos = tnt4882_disable_eos,
+	.parallel_poll = tnt4882_parallel_poll,
+	.parallel_poll_configure = tnt4882_parallel_poll_configure,
+	.parallel_poll_response = tnt4882_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = tnt4882_line_status,
+	.update_status = tnt4882_update_status,
+	.primary_address = tnt4882_primary_address,
+	.secondary_address = tnt4882_secondary_address,
+	.serial_poll_response2 = tnt4882_serial_poll_response2,
+	.serial_poll_status = tnt4882_serial_poll_status,
+	.t1_delay = tnt4882_t1_delay,
+	.return_to_local = tnt4882_return_to_local,
 };
 
-gpib_interface_t ni_isa_interface = {
-name: "ni_isa",
-attach : ni_tnt_isa_attach,
-detach : ni_isa_detach,
-read : tnt4882_accel_read,
-write : tnt4882_accel_write,
-command : tnt4882_command,
-take_control : tnt4882_take_control,
-go_to_standby : tnt4882_go_to_standby,
-request_system_control : tnt4882_request_system_control,
-interface_clear : tnt4882_interface_clear,
-remote_enable : tnt4882_remote_enable,
-enable_eos : tnt4882_enable_eos,
-disable_eos : tnt4882_disable_eos,
-parallel_poll : tnt4882_parallel_poll,
-parallel_poll_configure : tnt4882_parallel_poll_configure,
-parallel_poll_response : tnt4882_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : tnt4882_line_status,
-update_status : tnt4882_update_status,
-primary_address : tnt4882_primary_address,
-secondary_address : tnt4882_secondary_address,
-serial_poll_response2 : tnt4882_serial_poll_response2,
-serial_poll_status : tnt4882_serial_poll_status,
-t1_delay : tnt4882_t1_delay,
-return_to_local : tnt4882_return_to_local,
+static gpib_interface_t ni_isa_interface = {
+	.name = "ni_isa",
+	.attach = ni_tnt_isa_attach,
+	.detach = ni_isa_detach,
+	.read = tnt4882_accel_read,
+	.write = tnt4882_accel_write,
+	.command = tnt4882_command,
+	.take_control = tnt4882_take_control,
+	.go_to_standby = tnt4882_go_to_standby,
+	.request_system_control = tnt4882_request_system_control,
+	.interface_clear = tnt4882_interface_clear,
+	.remote_enable = tnt4882_remote_enable,
+	.enable_eos = tnt4882_enable_eos,
+	.disable_eos = tnt4882_disable_eos,
+	.parallel_poll = tnt4882_parallel_poll,
+	.parallel_poll_configure = tnt4882_parallel_poll_configure,
+	.parallel_poll_response = tnt4882_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = tnt4882_line_status,
+	.update_status = tnt4882_update_status,
+	.primary_address = tnt4882_primary_address,
+	.secondary_address = tnt4882_secondary_address,
+	.serial_poll_response2 = tnt4882_serial_poll_response2,
+	.serial_poll_status = tnt4882_serial_poll_status,
+	.t1_delay = tnt4882_t1_delay,
+	.return_to_local = tnt4882_return_to_local,
 };
 
-gpib_interface_t ni_nat4882_isa_interface = {
-name: "ni_nat4882_isa",
-attach : ni_nat4882_isa_attach,
-detach : ni_isa_detach,
-read : tnt4882_read,
-write : tnt4882_write,
-command : tnt4882_command_unaccel,
-take_control : tnt4882_take_control,
-go_to_standby : tnt4882_go_to_standby,
-request_system_control : tnt4882_request_system_control,
-interface_clear : tnt4882_interface_clear,
-remote_enable : tnt4882_remote_enable,
-enable_eos : tnt4882_enable_eos,
-disable_eos : tnt4882_disable_eos,
-parallel_poll : tnt4882_parallel_poll,
-parallel_poll_configure : tnt4882_parallel_poll_configure,
-parallel_poll_response : tnt4882_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : tnt4882_line_status,
-update_status : tnt4882_update_status,
-primary_address : tnt4882_primary_address,
-secondary_address : tnt4882_secondary_address,
-serial_poll_response2 : tnt4882_serial_poll_response2,
-serial_poll_status : tnt4882_serial_poll_status,
-t1_delay : tnt4882_t1_delay,
-return_to_local : tnt4882_return_to_local,
+static gpib_interface_t ni_nat4882_isa_interface = {
+	.name = "ni_nat4882_isa",
+	.attach = ni_nat4882_isa_attach,
+	.detach = ni_isa_detach,
+	.read = tnt4882_read,
+	.write = tnt4882_write,
+	.command = tnt4882_command_unaccel,
+	.take_control = tnt4882_take_control,
+	.go_to_standby = tnt4882_go_to_standby,
+	.request_system_control = tnt4882_request_system_control,
+	.interface_clear = tnt4882_interface_clear,
+	.remote_enable = tnt4882_remote_enable,
+	.enable_eos = tnt4882_enable_eos,
+	.disable_eos = tnt4882_disable_eos,
+	.parallel_poll = tnt4882_parallel_poll,
+	.parallel_poll_configure = tnt4882_parallel_poll_configure,
+	.parallel_poll_response = tnt4882_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = tnt4882_line_status,
+	.update_status = tnt4882_update_status,
+	.primary_address = tnt4882_primary_address,
+	.secondary_address = tnt4882_secondary_address,
+	.serial_poll_response2 = tnt4882_serial_poll_response2,
+	.serial_poll_status = tnt4882_serial_poll_status,
+	.t1_delay = tnt4882_t1_delay,
+	.return_to_local = tnt4882_return_to_local,
 };
 
-gpib_interface_t ni_nec_isa_interface = {
-name: "ni_nec_isa",
-attach : ni_nec_isa_attach,
-detach : ni_isa_detach,
-read : tnt4882_read,
-write : tnt4882_write,
-command : tnt4882_command_unaccel,
-take_control : tnt4882_take_control,
-go_to_standby : tnt4882_go_to_standby,
-request_system_control : tnt4882_request_system_control,
-interface_clear : tnt4882_interface_clear,
-remote_enable : tnt4882_remote_enable,
-enable_eos : tnt4882_enable_eos,
-disable_eos : tnt4882_disable_eos,
-parallel_poll : tnt4882_parallel_poll,
-parallel_poll_configure : tnt4882_parallel_poll_configure,
-parallel_poll_response : tnt4882_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : NULL,
-update_status : tnt4882_update_status,
-primary_address : tnt4882_primary_address,
-secondary_address : tnt4882_secondary_address,
-serial_poll_response : tnt4882_serial_poll_response,
-serial_poll_status : tnt4882_serial_poll_status,
-t1_delay : tnt4882_t1_delay,
-return_to_local : tnt4882_return_to_local,
+static gpib_interface_t ni_nec_isa_interface = {
+	.name = "ni_nec_isa",
+	.attach = ni_nec_isa_attach,
+	.detach = ni_isa_detach,
+	.read = tnt4882_read,
+	.write = tnt4882_write,
+	.command = tnt4882_command_unaccel,
+	.take_control = tnt4882_take_control,
+	.go_to_standby = tnt4882_go_to_standby,
+	.request_system_control = tnt4882_request_system_control,
+	.interface_clear = tnt4882_interface_clear,
+	.remote_enable = tnt4882_remote_enable,
+	.enable_eos = tnt4882_enable_eos,
+	.disable_eos = tnt4882_disable_eos,
+	.parallel_poll = tnt4882_parallel_poll,
+	.parallel_poll_configure = tnt4882_parallel_poll_configure,
+	.parallel_poll_response = tnt4882_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = NULL,
+	.update_status = tnt4882_update_status,
+	.primary_address = tnt4882_primary_address,
+	.secondary_address = tnt4882_secondary_address,
+	.serial_poll_response = tnt4882_serial_poll_response,
+	.serial_poll_status = tnt4882_serial_poll_status,
+	.t1_delay = tnt4882_t1_delay,
+	.return_to_local = tnt4882_return_to_local,
 };
 
-gpib_interface_t ni_isa_accel_interface = {
-name: "ni_isa_accel",
-attach : ni_tnt_isa_attach,
-detach : ni_isa_detach,
-read : tnt4882_accel_read,
-write : tnt4882_accel_write,
-command : tnt4882_command,
-take_control : tnt4882_take_control,
-go_to_standby : tnt4882_go_to_standby,
-request_system_control : tnt4882_request_system_control,
-interface_clear : tnt4882_interface_clear,
-remote_enable : tnt4882_remote_enable,
-enable_eos : tnt4882_enable_eos,
-disable_eos : tnt4882_disable_eos,
-parallel_poll : tnt4882_parallel_poll,
-parallel_poll_configure : tnt4882_parallel_poll_configure,
-parallel_poll_response : tnt4882_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : tnt4882_line_status,
-update_status : tnt4882_update_status,
-primary_address : tnt4882_primary_address,
-secondary_address : tnt4882_secondary_address,
-serial_poll_response2 : tnt4882_serial_poll_response2,
-serial_poll_status : tnt4882_serial_poll_status,
-t1_delay : tnt4882_t1_delay,
-return_to_local : tnt4882_return_to_local,
+static gpib_interface_t ni_isa_accel_interface = {
+	.name = "ni_isa_accel",
+	.attach = ni_tnt_isa_attach,
+	.detach = ni_isa_detach,
+	.read = tnt4882_accel_read,
+	.write = tnt4882_accel_write,
+	.command = tnt4882_command,
+	.take_control = tnt4882_take_control,
+	.go_to_standby = tnt4882_go_to_standby,
+	.request_system_control = tnt4882_request_system_control,
+	.interface_clear = tnt4882_interface_clear,
+	.remote_enable = tnt4882_remote_enable,
+	.enable_eos = tnt4882_enable_eos,
+	.disable_eos = tnt4882_disable_eos,
+	.parallel_poll = tnt4882_parallel_poll,
+	.parallel_poll_configure = tnt4882_parallel_poll_configure,
+	.parallel_poll_response = tnt4882_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = tnt4882_line_status,
+	.update_status = tnt4882_update_status,
+	.primary_address = tnt4882_primary_address,
+	.secondary_address = tnt4882_secondary_address,
+	.serial_poll_response2 = tnt4882_serial_poll_response2,
+	.serial_poll_status = tnt4882_serial_poll_status,
+	.t1_delay = tnt4882_t1_delay,
+	.return_to_local = tnt4882_return_to_local,
 };
 
-gpib_interface_t ni_nat4882_isa_accel_interface = {
-name: "ni_nat4882_isa_accel",
-attach : ni_nat4882_isa_attach,
-detach : ni_isa_detach,
-read : tnt4882_accel_read,
-write : tnt4882_accel_write,
-command : tnt4882_command_unaccel,
-take_control : tnt4882_take_control,
-go_to_standby : tnt4882_go_to_standby,
-request_system_control : tnt4882_request_system_control,
-interface_clear : tnt4882_interface_clear,
-remote_enable : tnt4882_remote_enable,
-enable_eos : tnt4882_enable_eos,
-disable_eos : tnt4882_disable_eos,
-parallel_poll : tnt4882_parallel_poll,
-parallel_poll_configure : tnt4882_parallel_poll_configure,
-parallel_poll_response : tnt4882_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : tnt4882_line_status,
-update_status : tnt4882_update_status,
-primary_address : tnt4882_primary_address,
-secondary_address : tnt4882_secondary_address,
-serial_poll_response2 : tnt4882_serial_poll_response2,
-serial_poll_status : tnt4882_serial_poll_status,
-t1_delay : tnt4882_t1_delay,
-return_to_local : tnt4882_return_to_local,
+static gpib_interface_t ni_nat4882_isa_accel_interface = {
+	.name = "ni_nat4882_isa_accel",
+	.attach = ni_nat4882_isa_attach,
+	.detach = ni_isa_detach,
+	.read = tnt4882_accel_read,
+	.write = tnt4882_accel_write,
+	.command = tnt4882_command_unaccel,
+	.take_control = tnt4882_take_control,
+	.go_to_standby = tnt4882_go_to_standby,
+	.request_system_control = tnt4882_request_system_control,
+	.interface_clear = tnt4882_interface_clear,
+	.remote_enable = tnt4882_remote_enable,
+	.enable_eos = tnt4882_enable_eos,
+	.disable_eos = tnt4882_disable_eos,
+	.parallel_poll = tnt4882_parallel_poll,
+	.parallel_poll_configure = tnt4882_parallel_poll_configure,
+	.parallel_poll_response = tnt4882_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = tnt4882_line_status,
+	.update_status = tnt4882_update_status,
+	.primary_address = tnt4882_primary_address,
+	.secondary_address = tnt4882_secondary_address,
+	.serial_poll_response2 = tnt4882_serial_poll_response2,
+	.serial_poll_status = tnt4882_serial_poll_status,
+	.t1_delay = tnt4882_t1_delay,
+	.return_to_local = tnt4882_return_to_local,
 };
 
-gpib_interface_t ni_nec_isa_accel_interface = {
-name: "ni_nec_isa_accel",
-attach : ni_nec_isa_attach,
-detach : ni_isa_detach,
-read : tnt4882_accel_read,
-write : tnt4882_accel_write,
-command : tnt4882_command_unaccel,
-take_control : tnt4882_take_control,
-go_to_standby : tnt4882_go_to_standby,
-request_system_control : tnt4882_request_system_control,
-interface_clear : tnt4882_interface_clear,
-remote_enable : tnt4882_remote_enable,
-enable_eos : tnt4882_enable_eos,
-disable_eos : tnt4882_disable_eos,
-parallel_poll : tnt4882_parallel_poll,
-parallel_poll_configure : tnt4882_parallel_poll_configure,
-parallel_poll_response : tnt4882_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : NULL,
-update_status : tnt4882_update_status,
-primary_address : tnt4882_primary_address,
-secondary_address : tnt4882_secondary_address,
-serial_poll_response : tnt4882_serial_poll_response,
-serial_poll_status : tnt4882_serial_poll_status,
-t1_delay : tnt4882_t1_delay,
-return_to_local : tnt4882_return_to_local,
+static gpib_interface_t ni_nec_isa_accel_interface = {
+	.name = "ni_nec_isa_accel",
+	.attach = ni_nec_isa_attach,
+	.detach = ni_isa_detach,
+	.read = tnt4882_accel_read,
+	.write = tnt4882_accel_write,
+	.command = tnt4882_command_unaccel,
+	.take_control = tnt4882_take_control,
+	.go_to_standby = tnt4882_go_to_standby,
+	.request_system_control = tnt4882_request_system_control,
+	.interface_clear = tnt4882_interface_clear,
+	.remote_enable = tnt4882_remote_enable,
+	.enable_eos = tnt4882_enable_eos,
+	.disable_eos = tnt4882_disable_eos,
+	.parallel_poll = tnt4882_parallel_poll,
+	.parallel_poll_configure = tnt4882_parallel_poll_configure,
+	.parallel_poll_response = tnt4882_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = NULL,
+	.update_status = tnt4882_update_status,
+	.primary_address = tnt4882_primary_address,
+	.secondary_address = tnt4882_secondary_address,
+	.serial_poll_response = tnt4882_serial_poll_response,
+	.serial_poll_status = tnt4882_serial_poll_status,
+	.t1_delay = tnt4882_t1_delay,
+	.return_to_local = tnt4882_return_to_local,
 };
 
 #ifdef GPIB_PCMCIA
-gpib_interface_t ni_pcmcia_interface = {
-name: "ni_pcmcia",
-attach : ni_pcmcia_attach,
-detach : ni_pcmcia_detach,
-read : tnt4882_accel_read,
-write : tnt4882_accel_write,
-command : tnt4882_command,
-take_control : tnt4882_take_control,
-go_to_standby : tnt4882_go_to_standby,
-request_system_control : tnt4882_request_system_control,
-interface_clear : tnt4882_interface_clear,
-remote_enable : tnt4882_remote_enable,
-enable_eos : tnt4882_enable_eos,
-disable_eos : tnt4882_disable_eos,
-parallel_poll : tnt4882_parallel_poll,
-parallel_poll_configure : tnt4882_parallel_poll_configure,
-parallel_poll_response : tnt4882_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : tnt4882_line_status,
-update_status : tnt4882_update_status,
-primary_address : tnt4882_primary_address,
-secondary_address : tnt4882_secondary_address,
-serial_poll_response : tnt4882_serial_poll_response,
-serial_poll_status : tnt4882_serial_poll_status,
-t1_delay : tnt4882_t1_delay,
-return_to_local : tnt4882_return_to_local,
+static gpib_interface_t ni_pcmcia_interface = {
+	.name = "ni_pcmcia",
+	.attach = ni_pcmcia_attach,
+	.detach = ni_pcmcia_detach,
+	.read = tnt4882_accel_read,
+	.write = tnt4882_accel_write,
+	.command = tnt4882_command,
+	.take_control = tnt4882_take_control,
+	.go_to_standby = tnt4882_go_to_standby,
+	.request_system_control = tnt4882_request_system_control,
+	.interface_clear = tnt4882_interface_clear,
+	.remote_enable = tnt4882_remote_enable,
+	.enable_eos = tnt4882_enable_eos,
+	.disable_eos = tnt4882_disable_eos,
+	.parallel_poll = tnt4882_parallel_poll,
+	.parallel_poll_configure = tnt4882_parallel_poll_configure,
+	.parallel_poll_response = tnt4882_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = tnt4882_line_status,
+	.update_status = tnt4882_update_status,
+	.primary_address = tnt4882_primary_address,
+	.secondary_address = tnt4882_secondary_address,
+	.serial_poll_response = tnt4882_serial_poll_response,
+	.serial_poll_status = tnt4882_serial_poll_status,
+	.t1_delay = tnt4882_t1_delay,
+	.return_to_local = tnt4882_return_to_local,
 };
 
-gpib_interface_t ni_pcmcia_accel_interface = {
-name: "ni_pcmcia_accel",
-attach : ni_pcmcia_attach,
-detach : ni_pcmcia_detach,
-read : tnt4882_accel_read,
-write : tnt4882_accel_write,
-command : tnt4882_command,
-take_control : tnt4882_take_control,
-go_to_standby : tnt4882_go_to_standby,
-request_system_control : tnt4882_request_system_control,
-interface_clear : tnt4882_interface_clear,
-remote_enable : tnt4882_remote_enable,
-enable_eos : tnt4882_enable_eos,
-disable_eos : tnt4882_disable_eos,
-parallel_poll : tnt4882_parallel_poll,
-parallel_poll_configure : tnt4882_parallel_poll_configure,
-parallel_poll_response : tnt4882_parallel_poll_response,
-local_parallel_poll_mode : NULL, // XXX
-line_status : tnt4882_line_status,
-update_status : tnt4882_update_status,
-primary_address : tnt4882_primary_address,
-secondary_address : tnt4882_secondary_address,
-serial_poll_response : tnt4882_serial_poll_response,
-serial_poll_status : tnt4882_serial_poll_status,
-t1_delay : tnt4882_t1_delay,
-return_to_local : tnt4882_return_to_local,
+static gpib_interface_t ni_pcmcia_accel_interface = {
+	.name = "ni_pcmcia_accel",
+	.attach = ni_pcmcia_attach,
+	.detach = ni_pcmcia_detach,
+	.read = tnt4882_accel_read,
+	.write = tnt4882_accel_write,
+	.command = tnt4882_command,
+	.take_control = tnt4882_take_control,
+	.go_to_standby = tnt4882_go_to_standby,
+	.request_system_control = tnt4882_request_system_control,
+	.interface_clear = tnt4882_interface_clear,
+	.remote_enable = tnt4882_remote_enable,
+	.enable_eos = tnt4882_enable_eos,
+	.disable_eos = tnt4882_disable_eos,
+	.parallel_poll = tnt4882_parallel_poll,
+	.parallel_poll_configure = tnt4882_parallel_poll_configure,
+	.parallel_poll_response = tnt4882_parallel_poll_response,
+	.local_parallel_poll_mode = NULL, // XXX
+	.line_status = tnt4882_line_status,
+	.update_status = tnt4882_update_status,
+	.primary_address = tnt4882_primary_address,
+	.secondary_address = tnt4882_secondary_address,
+	.serial_poll_response = tnt4882_serial_poll_response,
+	.serial_poll_status = tnt4882_serial_poll_status,
+	.t1_delay = tnt4882_t1_delay,
+	.return_to_local = tnt4882_return_to_local,
 };
 #endif
 
-- 
2.47.1

