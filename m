Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F3F21129A
	for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542357; cv=none; b=AZMaTPxmtr2H9ez83LZgSRmYRLdVoSIdDf1zKhVzbu8PA/8qqrbaJXIqhvryY0MXgMrrj6IeRfvrPdQ0aM5tvIbwb0U/ERcxIq8jfFKpYytdQj4h2srkPKseo1JuHpkflCsIU1F7uWg2kdvIqTS2oWCeNF7s0JBkKLpxYx3UKhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542357; c=relaxed/simple;
	bh=Mx7JDm8EAu8ExGQixLJQIhl4EBXDLJ5Nv5fDGD0ghm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SA08nzaOLJ9n9vKKQAlaJKstdkNWGgiazni5GYlzctoz0Q4l/+S3onBbzKM47V1L7ksf5sDm6DxpmPJkK2lbTcXDFVVhMLw7mMwMAAQ5Qmbfpvp0XjjX+gQ/OQcnUuoQTMM2gn6QLIr4hbyqVzmboA8Eunjkdlbt9Zrz1BQCi1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5ScKYHM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5ScKYHM"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e3621518so3083371f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 02:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737542349; x=1738147149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcgSqrYmpF9h2J3a+s5zIWh1av6NtW5ByPzQv7viIAg=;
        b=e5ScKYHMASgErXEa6SOkhMK6L4F3wYqTtbCJ6OiM6IbYt60Fx5spQBYAkyOHCfGZqB
         OdAYlNvljjPk52f4+u3D46sQDcdRTvKOfiU607AGzXb6yGMtr9xjRG+w1HBK2x6To38N
         gdHIEr06fl5FuBgvSYTuYlRemGvTvFoVfctcxyB65V7s7XfzuU37VYYinKHUaDw8dCqa
         RLGMN1Ua1KPl5+kPki+Kxblp1rZrevpjh5Zx7jZSqYn2Z18AlQYLxrXwegjWYNTAYqnl
         Ij6Og+y4Gx3mDkI6ppnhzsyPWojUj8TiHZ3apmaWOCxpUIT3K1empoxF802T/U9hgppf
         BTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737542349; x=1738147149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcgSqrYmpF9h2J3a+s5zIWh1av6NtW5ByPzQv7viIAg=;
        b=joxjSh5xdUfC0o1imlYTxRLbPsz4c6ogq3VEiJ+i0DmrCEPggBz/vs0mXrf1fAzy2Q
         /+MubmrXPAek7d10kDRtm+13whNq61sGD/xzxnmNCsYER0OWVSmJxo3eobZPabtgAh7U
         mNI0BuNvZA/XHFnmi1x09lvi3I8+fMwv+RCN8quuVi+XXZefsuydgYXo8rFc9U0BCRuj
         X3jlNUEcSn6oeO8mq5pTvFuOdM1upvkN+VKE+EXM3MyTTfJawjUgeyZS68jnm0easT8e
         t7lfRqViDz8OeW25GUYp8DwhtK/S1NOlA3p/iBqx259utT+PZ/E+SISy5+fqe0yzJLDP
         0WaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7ZwaR9k7myvJ2i03CzZtS9d/9u6drV/aOxjMSaCWKOxhpyiwH7L9xovJajhGr6Umf+kQl8Ofko07aNUBr@lists.linux.dev
X-Gm-Message-State: AOJu0YxOWPHOb/1wYXuphhgB1V5PgpWJmhcxnLzO+pgbq3/6h9BPlcIq
	TObn1Wh/IqTSJ9rj0DagTS3C3yNeLfUq1PTMOnEYSSzm8MadgV7g
X-Gm-Gg: ASbGncuZrCt/aUw6Zfmci42Y/sGh+7rkbjrEVOxEjvToVzWFUvaZKfK9C9u7Qw8FAvo
	0wlcZ9NnI0w+1EGNFr95sde8aa/rHRJQ+pXsRYOZtAY2HElev2KfSlwFWEAaiXV0Y5zN+lCJxnP
	4cU8WFjSwqzk2jpOSgGwDwQX+5UfBAKeDQDVh3r/t1ewunVV8lMUVttmAPzyhF4LbLCMuL7tThv
	9KqltaFZmBxwj63JJEW8WFlP18CjpBnNCtvw/+TEAbNUhtcD1Fh0oYGfdX4NOP6JyAVDCyZGKFo
	nC/ZyfeCsarzldsTEhUChB1my96sGA==
X-Google-Smtp-Source: AGHT+IFu5MDYphXgo/JqyDCuWeOjAQjtnnhBpNe7pq4Bk6iuBq6egjf2n1UUDAXKP1ixk2JSQD9Jug==
X-Received: by 2002:a05:6000:18ab:b0:38a:88a0:2234 with SMTP id ffacd0b85a97d-38bf5655328mr16171634f8f.4.1737542348805;
        Wed, 22 Jan 2025 02:39:08 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327ded8sm15661328f8f.89.2025.01.22.02.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:39:07 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/2] staging: gpib: Make static, reduce fwd declarations
Date: Wed, 22 Jan 2025 11:38:59 +0100
Message-ID: <20250122103859.25499-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122103859.25499-1-dpenkler@gmail.com>
References: <20250122103859.25499-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A number of drivers were unnecessarily not declaring their entry
points as static.

Declare them as static.

In order to reduce the number of forward declarations the gpib
interface structure initializations have been moved to after the
code of the entry points that they use. This also makes the
structure of the drivers to be more consistent between them.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 .../gpib/agilent_82350b/agilent_82350b.c      | 108 ++-
 .../gpib/agilent_82350b/agilent_82350b.h      |  47 --
 drivers/staging/gpib/cb7210/cb7210.c          |  89 ++-
 drivers/staging/gpib/cb7210/cb7210.h          |  45 --
 drivers/staging/gpib/cec/cec.h                |  29 -
 drivers/staging/gpib/cec/cec_gpib.c           |  51 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  52 +-
 drivers/staging/gpib/hp_82335/hp82335.h       |  30 -
 drivers/staging/gpib/hp_82341/hp_82341.c      |  71 +-
 drivers/staging/gpib/hp_82341/hp_82341.h      |  40 -
 drivers/staging/gpib/pc2/pc2_gpib.c           | 247 +++---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 718 ++++++++----------
 12 files changed, 636 insertions(+), 891 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index cd7fe7d814ce..5c62ec24fced 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -20,8 +20,14 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver for Agilent 82350b");
 
-int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
-			      size_t *bytes_read)
+static int read_transfer_counter(struct agilent_82350b_priv *a_priv);
+static unsigned short read_and_clear_event_status(gpib_board_t *board);
+static void set_transfer_counter(struct agilent_82350b_priv *a_priv, int count);
+static int agilent_82350b_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+				size_t *bytes_written);
+
+static int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
+				     size_t *bytes_read)
 
 {
 	struct agilent_82350b_priv *a_priv = board->private_data;
@@ -148,9 +154,8 @@ static int translate_wait_return_value(gpib_board_t *board, int retval)
 	return 0;
 }
 
-int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-			       size_t *bytes_written)
-
+static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length,
+				      int send_eoi, size_t *bytes_written)
 {
 	struct agilent_82350b_priv *a_priv = board->private_data;
 	struct tms9914_priv *tms_priv = &a_priv->tms9914_priv;
@@ -245,8 +250,7 @@ int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size_t leng
 	return 0;
 }
 
-unsigned short read_and_clear_event_status(gpib_board_t *board)
-
+static unsigned short read_and_clear_event_status(gpib_board_t *board)
 {
 	struct agilent_82350b_priv *a_priv = board->private_data;
 	unsigned long flags;
@@ -259,7 +263,7 @@ unsigned short read_and_clear_event_status(gpib_board_t *board)
 	return status;
 }
 
-irqreturn_t agilent_82350b_interrupt(int irq, void *arg)
+static irqreturn_t agilent_82350b_interrupt(int irq, void *arg)
 
 {
 	int tms9914_status1 = 0, tms9914_status2 = 0;
@@ -292,12 +296,11 @@ irqreturn_t agilent_82350b_interrupt(int irq, void *arg)
 	return retval;
 }
 
-void agilent_82350b_detach(gpib_board_t *board);
+static void agilent_82350b_detach(gpib_board_t *board);
 
 const char *driver_name = "agilent_82350b";
 
-int read_transfer_counter(struct agilent_82350b_priv *a_priv)
-
+static int read_transfer_counter(struct agilent_82350b_priv *a_priv)
 {
 	int lo, mid, value;
 
@@ -308,8 +311,7 @@ int read_transfer_counter(struct agilent_82350b_priv *a_priv)
 	return value;
 }
 
-void set_transfer_counter(struct agilent_82350b_priv *a_priv, int count)
-
+static void set_transfer_counter(struct agilent_82350b_priv *a_priv, int count)
 {
 	int complement = -count;
 
@@ -320,8 +322,8 @@ void set_transfer_counter(struct agilent_82350b_priv *a_priv, int count)
 }
 
 // wrappers for interface functions
-int agilent_82350b_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
-			size_t *bytes_read)
+static int agilent_82350b_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
+			       size_t *bytes_read)
 
 {
 	struct agilent_82350b_priv *priv = board->private_data;
@@ -329,8 +331,8 @@ int agilent_82350b_read(gpib_board_t *board, uint8_t *buffer, size_t length, int
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-int agilent_82350b_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-			 size_t *bytes_written)
+static int agilent_82350b_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+				size_t *bytes_written)
 
 {
 	struct agilent_82350b_priv *priv = board->private_data;
@@ -338,8 +340,8 @@ int agilent_82350b_write(gpib_board_t *board, uint8_t *buffer, size_t length, in
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-int agilent_82350b_command(gpib_board_t *board, uint8_t *buffer, size_t length,
-			   size_t *bytes_written)
+static int agilent_82350b_command(gpib_board_t *board, uint8_t *buffer, size_t length,
+				  size_t *bytes_written)
 
 {
 	struct agilent_82350b_priv *priv = board->private_data;
@@ -347,7 +349,7 @@ int agilent_82350b_command(gpib_board_t *board, uint8_t *buffer, size_t length,
 	return tms9914_command(board, &priv->tms9914_priv, buffer, length, bytes_written);
 }
 
-int agilent_82350b_take_control(gpib_board_t *board, int synchronous)
+static int agilent_82350b_take_control(gpib_board_t *board, int synchronous)
 
 {
 	struct agilent_82350b_priv *priv = board->private_data;
@@ -355,7 +357,7 @@ int agilent_82350b_take_control(gpib_board_t *board, int synchronous)
 	return tms9914_take_control_workaround(board, &priv->tms9914_priv, synchronous);
 }
 
-int agilent_82350b_go_to_standby(gpib_board_t *board)
+static int agilent_82350b_go_to_standby(gpib_board_t *board)
 
 {
 	struct agilent_82350b_priv *priv = board->private_data;
@@ -363,7 +365,7 @@ int agilent_82350b_go_to_standby(gpib_board_t *board)
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-void agilent_82350b_request_system_control(gpib_board_t *board, int request_control)
+static void agilent_82350b_request_system_control(gpib_board_t *board, int request_control)
 
 {
 	struct agilent_82350b_priv *a_priv = board->private_data;
@@ -381,7 +383,7 @@ void agilent_82350b_request_system_control(gpib_board_t *board, int request_cont
 	tms9914_request_system_control(board, &a_priv->tms9914_priv, request_control);
 }
 
-void agilent_82350b_interface_clear(gpib_board_t *board, int assert)
+static void agilent_82350b_interface_clear(gpib_board_t *board, int assert)
 
 {
 	struct agilent_82350b_priv *priv = board->private_data;
@@ -389,104 +391,91 @@ void agilent_82350b_interface_clear(gpib_board_t *board, int assert)
 	tms9914_interface_clear(board, &priv->tms9914_priv, assert);
 }
 
-void agilent_82350b_remote_enable(gpib_board_t *board, int enable)
-
+static void agilent_82350b_remote_enable(gpib_board_t *board, int enable)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-int agilent_82350b_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
-
+static int agilent_82350b_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	return tms9914_enable_eos(board, &priv->tms9914_priv, eos_byte, compare_8_bits);
 }
 
-void agilent_82350b_disable_eos(gpib_board_t *board)
-
+static void agilent_82350b_disable_eos(gpib_board_t *board)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	tms9914_disable_eos(board, &priv->tms9914_priv);
 }
 
-unsigned int agilent_82350b_update_status(gpib_board_t *board, unsigned int clear_mask)
-
+static unsigned int agilent_82350b_update_status(gpib_board_t *board, unsigned int clear_mask)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	return tms9914_update_status(board, &priv->tms9914_priv, clear_mask);
 }
 
-int agilent_82350b_primary_address(gpib_board_t *board, unsigned int address)
-
+static int agilent_82350b_primary_address(gpib_board_t *board, unsigned int address)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	return tms9914_primary_address(board, &priv->tms9914_priv, address);
 }
 
-int agilent_82350b_secondary_address(gpib_board_t *board, unsigned int address, int enable)
-
+static int agilent_82350b_secondary_address(gpib_board_t *board, unsigned int address, int enable)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	return tms9914_secondary_address(board, &priv->tms9914_priv, address, enable);
 }
 
-int agilent_82350b_parallel_poll(gpib_board_t *board, uint8_t *result)
-
+static int agilent_82350b_parallel_poll(gpib_board_t *board, uint8_t *result)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	return tms9914_parallel_poll(board, &priv->tms9914_priv, result);
 }
 
-void agilent_82350b_parallel_poll_configure(gpib_board_t *board, uint8_t config)
-
+static void agilent_82350b_parallel_poll_configure(gpib_board_t *board, uint8_t config)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	tms9914_parallel_poll_configure(board, &priv->tms9914_priv, config);
 }
 
-void agilent_82350b_parallel_poll_response(gpib_board_t *board, int ist)
-
+static void agilent_82350b_parallel_poll_response(gpib_board_t *board, int ist)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	tms9914_parallel_poll_response(board, &priv->tms9914_priv, ist);
 }
 
-void agilent_82350b_serial_poll_response(gpib_board_t *board, uint8_t status)
-
+static void agilent_82350b_serial_poll_response(gpib_board_t *board, uint8_t status)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	tms9914_serial_poll_response(board, &priv->tms9914_priv, status);
 }
 
-uint8_t agilent_82350b_serial_poll_status(gpib_board_t *board)
-
+static uint8_t agilent_82350b_serial_poll_status(gpib_board_t *board)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	return tms9914_serial_poll_status(board, &priv->tms9914_priv);
 }
 
-int agilent_82350b_line_status(const gpib_board_t *board)
-
+static int agilent_82350b_line_status(const gpib_board_t *board)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	return tms9914_line_status(board, &priv->tms9914_priv);
 }
 
-unsigned int agilent_82350b_t1_delay(gpib_board_t *board, unsigned int nanosec)
-
+static unsigned int agilent_82350b_t1_delay(gpib_board_t *board, unsigned int nanosec)
 {
 	struct agilent_82350b_priv *a_priv = board->private_data;
 	static const int nanosec_per_clock = 30;
@@ -501,16 +490,14 @@ unsigned int agilent_82350b_t1_delay(gpib_board_t *board, unsigned int nanosec)
 	return value * nanosec_per_clock;
 }
 
-void agilent_82350b_return_to_local(gpib_board_t *board)
-
+static void agilent_82350b_return_to_local(gpib_board_t *board)
 {
 	struct agilent_82350b_priv *priv = board->private_data;
 
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-int agilent_82350b_allocate_private(gpib_board_t *board)
-
+static int agilent_82350b_allocate_private(gpib_board_t *board)
 {
 	board->private_data = kzalloc(sizeof(struct agilent_82350b_priv), GFP_KERNEL);
 	if (!board->private_data)
@@ -518,15 +505,13 @@ int agilent_82350b_allocate_private(gpib_board_t *board)
 	return 0;
 }
 
-void agilent_82350b_free_private(gpib_board_t *board)
-
+static void agilent_82350b_free_private(gpib_board_t *board)
 {
 	kfree(board->private_data);
 	board->private_data = NULL;
 }
 
 static int init_82350a_hardware(gpib_board_t *board, const gpib_board_config_t *config)
-
 {
 	struct agilent_82350b_priv *a_priv = board->private_data;
 	static const unsigned int firmware_length = 5302;
@@ -774,20 +759,17 @@ static int agilent_82350b_generic_attach(gpib_board_t *board, const gpib_board_c
 	return 0;
 }
 
-int agilent_82350b_unaccel_attach(gpib_board_t *board, const gpib_board_config_t *config)
-
+static int agilent_82350b_unaccel_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	return agilent_82350b_generic_attach(board, config, 0);
 }
 
-int agilent_82350b_accel_attach(gpib_board_t *board, const gpib_board_config_t *config)
-
+static int agilent_82350b_accel_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	return agilent_82350b_generic_attach(board, config, 1);
 }
 
-void agilent_82350b_detach(gpib_board_t *board)
-
+static void agilent_82350b_detach(gpib_board_t *board)
 {
 	struct agilent_82350b_priv *a_priv = board->private_data;
 	struct tms9914_priv *tms_priv;
@@ -897,7 +879,6 @@ static struct pci_driver agilent_82350b_pci_driver = {
 };
 
 static int __init agilent_82350b_init_module(void)
-
 {
 	int result;
 
@@ -930,7 +911,6 @@ static int __init agilent_82350b_init_module(void)
 }
 
 static void __exit agilent_82350b_exit_module(void)
-
 {
 	gpib_unregister_driver(&agilent_82350b_interface);
 	gpib_unregister_driver(&agilent_82350b_unaccel_interface);
diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.h b/drivers/staging/gpib/agilent_82350b/agilent_82350b.h
index 32b322113c10..8b96ad12647e 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.h
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.h
@@ -60,53 +60,6 @@ struct agilent_82350b_priv {
 // driver name
 extern const char *driver_name;
 
-// init functions
-
-int agilent_82350b_unaccel_attach(gpib_board_t *board, const gpib_board_config_t *config);
-int agilent_82350b_accel_attach(gpib_board_t *board, const gpib_board_config_t *config);
-
-// interface functions
-int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
-			      size_t *bytes_read);
-int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-			       size_t *bytes_written);
-int agilent_82350b_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
-			size_t *bytes_read);
-int agilent_82350b_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-			 size_t *bytes_written);
-int agilent_82350b_command(gpib_board_t *board, uint8_t *buffer, size_t length,
-			   size_t *bytes_written);
-int agilent_82350b_take_control(gpib_board_t *board, int synchronous);
-int agilent_82350b_go_to_standby(gpib_board_t *board);
-void agilent_82350b_request_system_control(gpib_board_t *board, int request_control);
-void agilent_82350b_interface_clear(gpib_board_t *board, int assert);
-void agilent_82350b_remote_enable(gpib_board_t *board, int enable);
-int agilent_82350b_enable_eos(gpib_board_t *board, uint8_t eos_byte, int
-			compare_8_bits);
-void agilent_82350b_disable_eos(gpib_board_t *board);
-unsigned int agilent_82350b_update_status(gpib_board_t *board, unsigned int clear_mask);
-int agilent_82350b_primary_address(gpib_board_t *board, unsigned int address);
-int agilent_82350b_secondary_address(gpib_board_t *board, unsigned int address, int
-				enable);
-int agilent_82350b_parallel_poll(gpib_board_t *board, uint8_t *result);
-void agilent_82350b_parallel_poll_configure(gpib_board_t *board, uint8_t config);
-void agilent_82350b_parallel_poll_response(gpib_board_t *board, int ist);
-void agilent_82350b_serial_poll_response(gpib_board_t *board, uint8_t status);
-void agilent_82350b_return_to_local(gpib_board_t *board);
-uint8_t agilent_82350b_serial_poll_status(gpib_board_t *board);
-int agilent_82350b_line_status(const gpib_board_t *board);
-unsigned int agilent_82350b_t1_delay(gpib_board_t *board, unsigned int nanosec);
-
-// interrupt service routines
-irqreturn_t agilent_82350b_interrupt(int irq, void *arg);
-
-// utility functions
-int agilent_82350b_allocate_private(gpib_board_t *board);
-void agilent_82350b_free_private(gpib_board_t *board);
-unsigned short read_and_clear_event_status(gpib_board_t *board);
-int read_transfer_counter(struct agilent_82350b_priv *a_priv);
-void set_transfer_counter(struct agilent_82350b_priv *a_priv, int count);
-
 //registers
 enum agilent_82350b_gpib_registers
 
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 4d22f647a453..381c508f62eb 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -23,7 +23,10 @@
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver Measurement Computing boards using cb7210.2 and cbi488.2");
 
-static inline int have_fifo_word(const struct cb7210_priv *cb_priv)
+static int cb7210_read(gpib_board_t *board, uint8_t *buffer, size_t length,
+		       int *end, size_t *bytes_read);
+
+	static inline int have_fifo_word(const struct cb7210_priv *cb_priv)
 {
 	if (((cb7210_read_byte(cb_priv, HS_STATUS)) &
 	     (HS_RX_MSB_NOT_EMPTY | HS_RX_LSB_NOT_EMPTY)) ==
@@ -165,8 +168,8 @@ static int fifo_read(gpib_board_t *board, struct cb7210_priv *cb_priv, uint8_t *
 	return retval;
 }
 
-int cb7210_accel_read(gpib_board_t *board, uint8_t *buffer,
-		      size_t length, int *end, size_t *bytes_read)
+static int cb7210_accel_read(gpib_board_t *board, uint8_t *buffer,
+			     size_t length, int *end, size_t *bytes_read)
 {
 	ssize_t retval;
 	struct cb7210_priv *cb_priv = board->private_data;
@@ -347,8 +350,8 @@ static int fifo_write(gpib_board_t *board, uint8_t *buffer, size_t length, size_
 	return retval;
 }
 
-int cb7210_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-		       size_t *bytes_written)
+static int cb7210_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+			      size_t *bytes_written)
 {
 	struct cb7210_priv *cb_priv = board->private_data;
 	struct nec7210_priv *nec_priv = &cb_priv->nec7210_priv;
@@ -375,7 +378,7 @@ int cb7210_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length, int
 	return retval;
 }
 
-int cb7210_line_status(const gpib_board_t *board)
+static int cb7210_line_status(const gpib_board_t *board)
 {
 	int status = ValidALL;
 	int bsr_bits;
@@ -407,7 +410,7 @@ int cb7210_line_status(const gpib_board_t *board)
 	return status;
 }
 
-unsigned int cb7210_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static unsigned int cb7210_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	struct cb7210_priv *cb_priv = board->private_data;
 	struct nec7210_priv *nec_priv = &cb_priv->nec7210_priv;
@@ -424,13 +427,13 @@ unsigned int cb7210_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 	return retval;
 }
 
-irqreturn_t cb7210_locked_internal_interrupt(gpib_board_t *board);
+static irqreturn_t cb7210_locked_internal_interrupt(gpib_board_t *board);
 
 /*
  * GPIB interrupt service routines
  */
 
-irqreturn_t cb_pci_interrupt(int irq, void *arg)
+static irqreturn_t cb_pci_interrupt(int irq, void *arg)
 {
 	int bits;
 	gpib_board_t *board = arg;
@@ -462,7 +465,7 @@ irqreturn_t cb_pci_interrupt(int irq, void *arg)
 	return cb7210_locked_internal_interrupt(arg);
 }
 
-irqreturn_t cb7210_internal_interrupt(gpib_board_t *board)
+static irqreturn_t cb7210_internal_interrupt(gpib_board_t *board)
 {
 	int hs_status, status1, status2;
 	struct cb7210_priv *priv = board->private_data;
@@ -516,7 +519,7 @@ irqreturn_t cb7210_internal_interrupt(gpib_board_t *board)
 	return IRQ_HANDLED;
 }
 
-irqreturn_t cb7210_locked_internal_interrupt(gpib_board_t *board)
+static irqreturn_t cb7210_locked_internal_interrupt(gpib_board_t *board)
 {
 	unsigned long flags;
 	irqreturn_t retval;
@@ -527,7 +530,7 @@ irqreturn_t cb7210_locked_internal_interrupt(gpib_board_t *board)
 	return retval;
 }
 
-irqreturn_t cb7210_interrupt(int irq, void *arg)
+static irqreturn_t cb7210_interrupt(int irq, void *arg)
 {
 	return cb7210_internal_interrupt(arg);
 }
@@ -539,43 +542,45 @@ static void cb_pci_detach(gpib_board_t *board);
 static void cb_isa_detach(gpib_board_t *board);
 
 // wrappers for interface functions
-int cb7210_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end, size_t *bytes_read)
+static int cb7210_read(gpib_board_t *board, uint8_t *buffer, size_t length,
+		       int *end, size_t *bytes_read)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-int cb7210_write(gpib_board_t *board, uint8_t *buffer, size_t length,
-		 int send_eoi, size_t *bytes_written)
+static int cb7210_write(gpib_board_t *board, uint8_t *buffer, size_t length,
+			int send_eoi, size_t *bytes_written)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-int cb7210_command(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written)
+static int cb7210_command(gpib_board_t *board, uint8_t *buffer, size_t length,
+			  size_t *bytes_written)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	return nec7210_command(board, &priv->nec7210_priv, buffer, length, bytes_written);
 }
 
-int cb7210_take_control(gpib_board_t *board, int synchronous)
+static int cb7210_take_control(gpib_board_t *board, int synchronous)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	return nec7210_take_control(board, &priv->nec7210_priv, synchronous);
 }
 
-int cb7210_go_to_standby(gpib_board_t *board)
+static int cb7210_go_to_standby(gpib_board_t *board)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-void cb7210_request_system_control(gpib_board_t *board, int request_control)
+static void cb7210_request_system_control(gpib_board_t *board, int request_control)
 {
 	struct cb7210_priv *priv = board->private_data;
 	struct nec7210_priv *nec_priv = &priv->nec7210_priv;
@@ -589,91 +594,91 @@ void cb7210_request_system_control(gpib_board_t *board, int request_control)
 	nec7210_request_system_control(board, nec_priv, request_control);
 }
 
-void cb7210_interface_clear(gpib_board_t *board, int assert)
+static void cb7210_interface_clear(gpib_board_t *board, int assert)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	nec7210_interface_clear(board, &priv->nec7210_priv, assert);
 }
 
-void cb7210_remote_enable(gpib_board_t *board, int enable)
+static void cb7210_remote_enable(gpib_board_t *board, int enable)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-int cb7210_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
+static int cb7210_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	return nec7210_enable_eos(board, &priv->nec7210_priv, eos_byte, compare_8_bits);
 }
 
-void cb7210_disable_eos(gpib_board_t *board)
+static void cb7210_disable_eos(gpib_board_t *board)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	nec7210_disable_eos(board, &priv->nec7210_priv);
 }
 
-unsigned int cb7210_update_status(gpib_board_t *board, unsigned int clear_mask)
+static unsigned int cb7210_update_status(gpib_board_t *board, unsigned int clear_mask)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	return nec7210_update_status(board, &priv->nec7210_priv, clear_mask);
 }
 
-int cb7210_primary_address(gpib_board_t *board, unsigned int address)
+static int cb7210_primary_address(gpib_board_t *board, unsigned int address)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	return nec7210_primary_address(board, &priv->nec7210_priv, address);
 }
 
-int cb7210_secondary_address(gpib_board_t *board, unsigned int address, int enable)
+static int cb7210_secondary_address(gpib_board_t *board, unsigned int address, int enable)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-int cb7210_parallel_poll(gpib_board_t *board, uint8_t *result)
+static int cb7210_parallel_poll(gpib_board_t *board, uint8_t *result)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-void cb7210_parallel_poll_configure(gpib_board_t *board, uint8_t configuration)
+static void cb7210_parallel_poll_configure(gpib_board_t *board, uint8_t configuration)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	nec7210_parallel_poll_configure(board, &priv->nec7210_priv, configuration);
 }
 
-void cb7210_parallel_poll_response(gpib_board_t *board, int ist)
+static void cb7210_parallel_poll_response(gpib_board_t *board, int ist)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-void cb7210_serial_poll_response(gpib_board_t *board, uint8_t status)
+static void cb7210_serial_poll_response(gpib_board_t *board, uint8_t status)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	nec7210_serial_poll_response(board, &priv->nec7210_priv, status);
 }
 
-uint8_t cb7210_serial_poll_status(gpib_board_t *board)
+static uint8_t cb7210_serial_poll_status(gpib_board_t *board)
 {
 	struct cb7210_priv *priv = board->private_data;
 
 	return nec7210_serial_poll_status(board, &priv->nec7210_priv);
 }
 
-void cb7210_return_to_local(gpib_board_t *board)
+static void cb7210_return_to_local(gpib_board_t *board)
 {
 	struct cb7210_priv *priv = board->private_data;
 	struct nec7210_priv *nec_priv = &priv->nec7210_priv;
@@ -862,14 +867,14 @@ static int cb7210_allocate_private(gpib_board_t *board)
 	return 0;
 }
 
-void cb7210_generic_detach(gpib_board_t *board)
+static void cb7210_generic_detach(gpib_board_t *board)
 {
 	kfree(board->private_data);
 	board->private_data = NULL;
 }
 
 // generic part of attach functions shared by all cb7210 boards
-int cb7210_generic_attach(gpib_board_t *board)
+static int cb7210_generic_attach(gpib_board_t *board)
 {
 	struct cb7210_priv *cb_priv;
 	struct nec7210_priv *nec_priv;
@@ -887,7 +892,7 @@ int cb7210_generic_attach(gpib_board_t *board)
 	return 0;
 }
 
-int cb7210_init(struct cb7210_priv *cb_priv, gpib_board_t *board)
+static int cb7210_init(struct cb7210_priv *cb_priv, gpib_board_t *board)
 {
 	struct nec7210_priv *nec_priv = &cb_priv->nec7210_priv;
 
@@ -923,7 +928,7 @@ int cb7210_init(struct cb7210_priv *cb_priv, gpib_board_t *board)
 	return 0;
 }
 
-int cb_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int cb_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	struct cb7210_priv *cb_priv;
 	struct nec7210_priv *nec_priv;
@@ -1004,7 +1009,7 @@ int cb_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	return cb7210_init(cb_priv, board);
 }
 
-void cb_pci_detach(gpib_board_t *board)
+static void cb_pci_detach(gpib_board_t *board)
 {
 	struct cb7210_priv *cb_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
@@ -1027,7 +1032,7 @@ void cb_pci_detach(gpib_board_t *board)
 	cb7210_generic_detach(board);
 }
 
-int cb_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int cb_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	int isr_flags = 0;
 	struct cb7210_priv *cb_priv;
@@ -1061,7 +1066,7 @@ int cb_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	return cb7210_init(cb_priv, board);
 }
 
-void cb_isa_detach(gpib_board_t *board)
+static void cb_isa_detach(gpib_board_t *board)
 {
 	struct cb7210_priv *cb_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
@@ -1351,7 +1356,7 @@ static struct pcmcia_driver cb_gpib_cs_driver = {
 	.resume		= cb_gpib_resume,
 };
 
-void cb_pcmcia_cleanup_module(void)
+static void cb_pcmcia_cleanup_module(void)
 {
 	DEBUG(0, "cb_gpib_cs: unloading\n");
 	pcmcia_unregister_driver(&cb_gpib_cs_driver);
@@ -1441,7 +1446,7 @@ static gpib_interface_t cb_pcmcia_accel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-int cb_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int cb_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	struct cb7210_priv *cb_priv;
 	struct nec7210_priv *nec_priv;
@@ -1478,7 +1483,7 @@ int cb_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	return cb7210_init(cb_priv, board);
 }
 
-void cb_pcmcia_detach(gpib_board_t *board)
+static void cb_pcmcia_detach(gpib_board_t *board)
 {
 	struct cb7210_priv *cb_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
diff --git a/drivers/staging/gpib/cb7210/cb7210.h b/drivers/staging/gpib/cb7210/cb7210.h
index d56cd905cc8c..2108fe7a8ce5 100644
--- a/drivers/staging/gpib/cb7210/cb7210.h
+++ b/drivers/staging/gpib/cb7210/cb7210.h
@@ -36,51 +36,6 @@ struct cb7210_priv {
 	unsigned in_fifo_half_full : 1;
 };
 
-// interrupt service routines
-irqreturn_t cb_pci_interrupt(int irq, void *arg);
-irqreturn_t cb7210_interrupt(int irq, void *arg);
-irqreturn_t cb7210_internal_interrupt(gpib_board_t *board);
-
-// interface functions
-int cb7210_read(gpib_board_t *board, uint8_t *buffer, size_t length,
-		int *end, size_t *bytes_read);
-int cb7210_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length,
-		      int *end, size_t *bytes_read);
-int cb7210_write(gpib_board_t *board, uint8_t *buffer, size_t length,
-		 int send_eoi, size_t *bytes_written);
-int cb7210_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length,
-		       int send_eoi, size_t *bytes_written);
-int cb7210_command(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written);
-int cb7210_take_control(gpib_board_t *board, int synchronous);
-int cb7210_go_to_standby(gpib_board_t *board);
-void cb7210_request_system_control(gpib_board_t *board, int request_control);
-void cb7210_interface_clear(gpib_board_t *board, int assert);
-void cb7210_remote_enable(gpib_board_t *board, int enable);
-int cb7210_enable_eos(gpib_board_t *board, uint8_t eos_byte,
-		      int compare_8_bits);
-void cb7210_disable_eos(gpib_board_t *board);
-unsigned int cb7210_update_status(gpib_board_t *board, unsigned int clear_mask);
-int cb7210_primary_address(gpib_board_t *board, unsigned int address);
-int cb7210_secondary_address(gpib_board_t *board, unsigned int address,
-			     int enable);
-int cb7210_parallel_poll(gpib_board_t *board, uint8_t *result);
-void cb7210_serial_poll_response(gpib_board_t *board, uint8_t status);
-uint8_t cb7210_serial_poll_status(gpib_board_t *board);
-void cb7210_parallel_poll_configure(gpib_board_t *board, uint8_t configuration);
-void cb7210_parallel_poll_response(gpib_board_t *board, int ist);
-int cb7210_line_status(const gpib_board_t *board);
-unsigned int cb7210_t1_delay(gpib_board_t *board, unsigned int nano_sec);
-void cb7210_return_to_local(gpib_board_t *board);
-
-// utility functions
-void cb7210_generic_detach(gpib_board_t *board);
-int cb7210_generic_attach(gpib_board_t *board);
-int cb7210_init(struct cb7210_priv *priv, gpib_board_t *board);
-
-// pcmcia init/cleanup
-int cb_pcmcia_init_module(void);
-void cb_pcmcia_cleanup_module(void);
-
 // pci-gpib register offset
 static const int cb7210_reg_offset = 1;
 
diff --git a/drivers/staging/gpib/cec/cec.h b/drivers/staging/gpib/cec/cec.h
index 040ca70ed708..3ce2869c7429 100644
--- a/drivers/staging/gpib/cec/cec.h
+++ b/drivers/staging/gpib/cec/cec.h
@@ -16,34 +16,5 @@ struct cec_priv  {
 	unsigned int irq;
 };
 
-// interface functions
-int cec_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end, size_t *bytes_read);
-int cec_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-	      size_t *bytes_written);
-int cec_command(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written);
-int cec_take_control(gpib_board_t *board, int synchronous);
-int cec_go_to_standby(gpib_board_t *board);
-void cec_request_system_control(gpib_board_t *board, int request_control);
-void cec_interface_clear(gpib_board_t *board, int assert);
-void cec_remote_enable(gpib_board_t *board, int enable);
-int cec_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits);
-void cec_disable_eos(gpib_board_t *board);
-unsigned int cec_update_status(gpib_board_t *board, unsigned int clear_mask);
-int cec_primary_address(gpib_board_t *board, unsigned int address);
-int cec_secondary_address(gpib_board_t *board, unsigned int address, int enable);
-int cec_parallel_poll(gpib_board_t *board, uint8_t *result);
-void cec_parallel_poll_configure(gpib_board_t *board, uint8_t configuration);
-void cec_parallel_poll_response(gpib_board_t *board, int ist);
-void cec_serial_poll_response(gpib_board_t *board, uint8_t status);
-void cec_return_to_local(gpib_board_t *board);
-
-// interrupt service routines
-irqreturn_t cec_interrupt(int irq, void *arg);
-
-// utility functions
-void cec_free_private(gpib_board_t *board);
-int cec_generic_attach(gpib_board_t *board);
-void cec_init(struct cec_priv *priv, const gpib_board_t *board);
-
 // offset between consecutive nec7210 registers
 static const int cec_reg_offset = 1;
diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index d056cd1d6b3e..18933223711e 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -19,7 +19,7 @@ MODULE_DESCRIPTION("GPIB driver for CEC PCI and PCMCIA boards");
  * GPIB interrupt service routines
  */
 
-irqreturn_t cec_interrupt(int irq, void *arg)
+static irqreturn_t cec_interrupt(int irq, void *arg)
 {
 	gpib_board_t *board = arg;
 	struct cec_priv *priv = board->private_data;
@@ -41,120 +41,121 @@ static int cec_pci_attach(gpib_board_t *board, const gpib_board_config_t *config
 static void cec_pci_detach(gpib_board_t *board);
 
 // wrappers for interface functions
-int cec_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end, size_t *bytes_read)
+static int cec_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
+		    size_t *bytes_read)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_read(board, &priv->nec7210_priv, buffer, length, end, bytes_read);
 }
 
-int cec_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-	      size_t *bytes_written)
+static int cec_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+		     size_t *bytes_written)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-int cec_command(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written)
+static int cec_command(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_command(board, &priv->nec7210_priv, buffer, length, bytes_written);
 }
 
-int cec_take_control(gpib_board_t *board, int synchronous)
+static int cec_take_control(gpib_board_t *board, int synchronous)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_take_control(board, &priv->nec7210_priv, synchronous);
 }
 
-int cec_go_to_standby(gpib_board_t *board)
+static int cec_go_to_standby(gpib_board_t *board)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-void cec_request_system_control(gpib_board_t *board, int request_control)
+static void cec_request_system_control(gpib_board_t *board, int request_control)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
 }
 
-void cec_interface_clear(gpib_board_t *board, int assert)
+static void cec_interface_clear(gpib_board_t *board, int assert)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_interface_clear(board, &priv->nec7210_priv, assert);
 }
 
-void cec_remote_enable(gpib_board_t *board, int enable)
+static void cec_remote_enable(gpib_board_t *board, int enable)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-int cec_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
+static int cec_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_enable_eos(board, &priv->nec7210_priv, eos_byte, compare_8_bits);
 }
 
-void cec_disable_eos(gpib_board_t *board)
+static void cec_disable_eos(gpib_board_t *board)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_disable_eos(board, &priv->nec7210_priv);
 }
 
-unsigned int cec_update_status(gpib_board_t *board, unsigned int clear_mask)
+static unsigned int cec_update_status(gpib_board_t *board, unsigned int clear_mask)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_update_status(board, &priv->nec7210_priv, clear_mask);
 }
 
-int cec_primary_address(gpib_board_t *board, unsigned int address)
+static int cec_primary_address(gpib_board_t *board, unsigned int address)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_primary_address(board, &priv->nec7210_priv, address);
 }
 
-int cec_secondary_address(gpib_board_t *board, unsigned int address, int enable)
+static int cec_secondary_address(gpib_board_t *board, unsigned int address, int enable)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-int cec_parallel_poll(gpib_board_t *board, uint8_t *result)
+static int cec_parallel_poll(gpib_board_t *board, uint8_t *result)
 {
 	struct cec_priv *priv = board->private_data;
 
 	return nec7210_parallel_poll(board, &priv->nec7210_priv, result);
 }
 
-void cec_parallel_poll_configure(gpib_board_t *board, uint8_t config)
+static void cec_parallel_poll_configure(gpib_board_t *board, uint8_t config)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_parallel_poll_configure(board, &priv->nec7210_priv, config);
 }
 
-void cec_parallel_poll_response(gpib_board_t *board, int ist)
+static void cec_parallel_poll_response(gpib_board_t *board, int ist)
 {
 	struct cec_priv *priv = board->private_data;
 
 	nec7210_parallel_poll_response(board, &priv->nec7210_priv, ist);
 }
 
-void cec_serial_poll_response(gpib_board_t *board, uint8_t status)
+static void cec_serial_poll_response(gpib_board_t *board, uint8_t status)
 {
 	struct cec_priv *priv = board->private_data;
 
@@ -175,7 +176,7 @@ static unsigned int cec_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 	return nec7210_t1_delay(board, &priv->nec7210_priv, nano_sec);
 }
 
-void cec_return_to_local(gpib_board_t *board)
+static void cec_return_to_local(gpib_board_t *board)
 {
 	struct cec_priv *priv = board->private_data;
 
@@ -223,13 +224,13 @@ static int cec_allocate_private(gpib_board_t *board)
 	return 0;
 }
 
-void cec_free_private(gpib_board_t *board)
+static void cec_free_private(gpib_board_t *board)
 {
 	kfree(board->private_data);
 	board->private_data = NULL;
 }
 
-int cec_generic_attach(gpib_board_t *board)
+static int cec_generic_attach(gpib_board_t *board)
 {
 	struct cec_priv *cec_priv;
 	struct nec7210_priv *nec_priv;
@@ -247,7 +248,7 @@ int cec_generic_attach(gpib_board_t *board)
 	return 0;
 }
 
-void cec_init(struct cec_priv *cec_priv, const gpib_board_t *board)
+static void cec_init(struct cec_priv *cec_priv, const gpib_board_t *board)
 {
 	struct nec7210_priv *nec_priv = &cec_priv->nec7210_priv;
 
@@ -259,7 +260,7 @@ void cec_init(struct cec_priv *cec_priv, const gpib_board_t *board)
 	nec7210_board_online(nec_priv, board);
 }
 
-int cec_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int cec_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	struct cec_priv *cec_priv;
 	struct nec7210_priv *nec_priv;
@@ -319,7 +320,7 @@ int cec_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	return 0;
 }
 
-void cec_pci_detach(gpib_board_t *board)
+static void cec_pci_detach(gpib_board_t *board)
 {
 	struct cec_priv *cec_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 700d1ba029d2..451d5dc6d340 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -21,124 +21,126 @@ MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver for HP 82335 interface cards");
 
 static int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config);
-
 static void hp82335_detach(gpib_board_t *board);
+static irqreturn_t hp82335_interrupt(int irq, void *arg);
 
 // wrappers for interface functions
-int hp82335_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end, size_t *bytes_read)
+static int hp82335_read(gpib_board_t *board, uint8_t *buffer, size_t length,
+			int *end, size_t *bytes_read)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-int hp82335_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-		  size_t *bytes_written)
+static int hp82335_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+			 size_t *bytes_written)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-int hp82335_command(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written)
+static int hp82335_command(gpib_board_t *board, uint8_t *buffer, size_t length,
+			   size_t *bytes_written)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_command(board, &priv->tms9914_priv, buffer, length, bytes_written);
 }
 
-int hp82335_take_control(gpib_board_t *board, int synchronous)
+static int hp82335_take_control(gpib_board_t *board, int synchronous)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_take_control(board, &priv->tms9914_priv, synchronous);
 }
 
-int hp82335_go_to_standby(gpib_board_t *board)
+static int hp82335_go_to_standby(gpib_board_t *board)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-void hp82335_request_system_control(gpib_board_t *board, int request_control)
+static void hp82335_request_system_control(gpib_board_t *board, int request_control)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_request_system_control(board, &priv->tms9914_priv, request_control);
 }
 
-void hp82335_interface_clear(gpib_board_t *board, int assert)
+static void hp82335_interface_clear(gpib_board_t *board, int assert)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_interface_clear(board, &priv->tms9914_priv, assert);
 }
 
-void hp82335_remote_enable(gpib_board_t *board, int enable)
+static void hp82335_remote_enable(gpib_board_t *board, int enable)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-int hp82335_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
+static int hp82335_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_enable_eos(board, &priv->tms9914_priv, eos_byte, compare_8_bits);
 }
 
-void hp82335_disable_eos(gpib_board_t *board)
+static void hp82335_disable_eos(gpib_board_t *board)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_disable_eos(board, &priv->tms9914_priv);
 }
 
-unsigned int hp82335_update_status(gpib_board_t *board, unsigned int clear_mask)
+static unsigned int hp82335_update_status(gpib_board_t *board, unsigned int clear_mask)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_update_status(board, &priv->tms9914_priv, clear_mask);
 }
 
-int hp82335_primary_address(gpib_board_t *board, unsigned int address)
+static int hp82335_primary_address(gpib_board_t *board, unsigned int address)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_primary_address(board, &priv->tms9914_priv, address);
 }
 
-int hp82335_secondary_address(gpib_board_t *board, unsigned int address, int enable)
+static int hp82335_secondary_address(gpib_board_t *board, unsigned int address, int enable)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_secondary_address(board, &priv->tms9914_priv, address, enable);
 }
 
-int hp82335_parallel_poll(gpib_board_t *board, uint8_t *result)
+static int hp82335_parallel_poll(gpib_board_t *board, uint8_t *result)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	return tms9914_parallel_poll(board, &priv->tms9914_priv, result);
 }
 
-void hp82335_parallel_poll_configure(gpib_board_t *board, uint8_t config)
+static void hp82335_parallel_poll_configure(gpib_board_t *board, uint8_t config)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_parallel_poll_configure(board, &priv->tms9914_priv, config);
 }
 
-void hp82335_parallel_poll_response(gpib_board_t *board, int ist)
+static void hp82335_parallel_poll_response(gpib_board_t *board, int ist)
 {
 	struct hp82335_priv *priv = board->private_data;
 
 	tms9914_parallel_poll_response(board, &priv->tms9914_priv, ist);
 }
 
-void hp82335_serial_poll_response(gpib_board_t *board, uint8_t status)
+static void hp82335_serial_poll_response(gpib_board_t *board, uint8_t status)
 {
 	struct hp82335_priv *priv = board->private_data;
 
@@ -166,7 +168,7 @@ static unsigned int hp82335_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 	return tms9914_t1_delay(board, &priv->tms9914_priv, nano_sec);
 }
 
-void hp82335_return_to_local(gpib_board_t *board)
+static void hp82335_return_to_local(gpib_board_t *board)
 {
 	struct hp82335_priv *priv = board->private_data;
 
@@ -201,7 +203,7 @@ static gpib_interface_t hp82335_interface = {
 	.return_to_local = hp82335_return_to_local,
 };
 
-int hp82335_allocate_private(gpib_board_t *board)
+static int hp82335_allocate_private(gpib_board_t *board)
 {
 	board->private_data = kzalloc(sizeof(struct hp82335_priv), GFP_KERNEL);
 	if (!board->private_data)
@@ -209,7 +211,7 @@ int hp82335_allocate_private(gpib_board_t *board)
 	return 0;
 }
 
-void hp82335_free_private(gpib_board_t *board)
+static void hp82335_free_private(gpib_board_t *board)
 {
 	kfree(board->private_data);
 	board->private_data = NULL;
@@ -237,7 +239,7 @@ static void hp82335_clear_interrupt(struct hp82335_priv *hp_priv)
 	writeb(0, tms_priv->mmiobase + HPREG_INTR_CLEAR);
 }
 
-int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	struct hp82335_priv *hp_priv;
 	struct tms9914_priv *tms_priv;
@@ -304,7 +306,7 @@ int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	return 0;
 }
 
-void hp82335_detach(gpib_board_t *board)
+static void hp82335_detach(gpib_board_t *board)
 {
 	struct hp82335_priv *hp_priv = board->private_data;
 	struct tms9914_priv *tms_priv;
@@ -348,7 +350,7 @@ module_exit(hp82335_exit_module);
  * GPIB interrupt service routines
  */
 
-irqreturn_t hp82335_interrupt(int irq, void *arg)
+static irqreturn_t hp82335_interrupt(int irq, void *arg)
 {
 	int status1, status2;
 	gpib_board_t *board = arg;
diff --git a/drivers/staging/gpib/hp_82335/hp82335.h b/drivers/staging/gpib/hp_82335/hp82335.h
index 4b185d7c5188..0c252a712ec9 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.h
+++ b/drivers/staging/gpib/hp_82335/hp82335.h
@@ -17,36 +17,6 @@ struct hp82335_priv  {
 	unsigned long raw_iobase;
 };
 
-// interface functions
-int hp82335_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end, size_t *bytes_read);
-int hp82335_write(gpib_board_t *board, uint8_t *buffer, size_t length,
-		  int send_eoi, size_t *bytes_written);
-int hp82335_command(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written);
-int hp82335_take_control(gpib_board_t *board, int synchronous);
-int hp82335_go_to_standby(gpib_board_t *board);
-void hp82335_request_system_control(gpib_board_t *board, int request_control);
-void hp82335_interface_clear(gpib_board_t *board, int assert);
-void hp82335_remote_enable(gpib_board_t *board, int enable);
-int hp82335_enable_eos(gpib_board_t *board, uint8_t eos_byte, int
-	compare_8_bits);
-void hp82335_disable_eos(gpib_board_t *board);
-unsigned int hp82335_update_status(gpib_board_t *board, unsigned int clear_mask);
-int hp82335_primary_address(gpib_board_t *board, unsigned int address);
-int hp82335_secondary_address(gpib_board_t *board, unsigned int address, int
-	enable);
-int hp82335_parallel_poll(gpib_board_t *board, uint8_t *result);
-void hp82335_parallel_poll_configure(gpib_board_t *board, uint8_t config);
-void hp82335_parallel_poll_response(gpib_board_t *board, int ist);
-void hp82335_serial_poll_response(gpib_board_t *board, uint8_t status);
-void hp82335_return_to_local(gpib_board_t *board);
-
-// interrupt service routines
-irqreturn_t hp82335_interrupt(int irq, void *arg);
-
-// utility functions
-int hp82335_allocate_private(gpib_board_t *board);
-void hp82335_free_private(gpib_board_t *board);
-
 // size of io memory region used
 static const int hp82335_rom_size = 0x2000;
 static const int hp82335_upper_iomem_size = 0x2000;
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 0ddae295912f..9cd2a2f50ff1 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -17,8 +17,15 @@
 
 MODULE_LICENSE("GPL");
 
-int hp_82341_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
-			size_t *bytes_read)
+static unsigned short read_and_clear_event_status(gpib_board_t *board);
+static void set_transfer_counter(struct hp_82341_priv *hp_priv, int count);
+static int read_transfer_counter(struct hp_82341_priv *hp_priv);
+static int hp_82341_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+			  size_t *bytes_written);
+static irqreturn_t hp_82341_interrupt(int irq, void *arg);
+
+static int hp_82341_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
+			       size_t *bytes_read)
 {
 	struct hp_82341_priv *hp_priv = board->private_data;
 	struct tms9914_priv *tms_priv = &hp_priv->tms9914_priv;
@@ -163,8 +170,8 @@ static int restart_write_fifo(gpib_board_t *board, struct hp_82341_priv *hp_priv
 	return 0;
 }
 
-int hp_82341_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length,
-			 int send_eoi, size_t *bytes_written)
+static int hp_82341_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length,
+				int send_eoi, size_t *bytes_written)
 {
 	struct hp_82341_priv *hp_priv = board->private_data;
 	struct tms9914_priv *tms_priv = &hp_priv->tms9914_priv;
@@ -249,43 +256,45 @@ static int hp_82341_attach(gpib_board_t *board, const gpib_board_config_t *confi
 static void hp_82341_detach(gpib_board_t *board);
 
 // wrappers for interface functions
-int hp_82341_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end, size_t *bytes_read)
+static int hp_82341_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
+			 size_t *bytes_read)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	return tms9914_read(board, &priv->tms9914_priv, buffer, length, end, bytes_read);
 }
 
-int hp_82341_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-		   size_t *bytes_written)
+static int hp_82341_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+			  size_t *bytes_written)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	return tms9914_write(board, &priv->tms9914_priv, buffer, length, send_eoi, bytes_written);
 }
 
-int hp_82341_command(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written)
+static int hp_82341_command(gpib_board_t *board, uint8_t *buffer, size_t length,
+			    size_t *bytes_written)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	return tms9914_command(board, &priv->tms9914_priv, buffer, length, bytes_written);
 }
 
-int hp_82341_take_control(gpib_board_t *board, int synchronous)
+static int hp_82341_take_control(gpib_board_t *board, int synchronous)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	return tms9914_take_control(board, &priv->tms9914_priv, synchronous);
 }
 
-int hp_82341_go_to_standby(gpib_board_t *board)
+static int hp_82341_go_to_standby(gpib_board_t *board)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	return tms9914_go_to_standby(board, &priv->tms9914_priv);
 }
 
-void hp_82341_request_system_control(gpib_board_t *board, int request_control)
+static void hp_82341_request_system_control(gpib_board_t *board, int request_control)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -297,77 +306,77 @@ void hp_82341_request_system_control(gpib_board_t *board, int request_control)
 	tms9914_request_system_control(board, &priv->tms9914_priv, request_control);
 }
 
-void hp_82341_interface_clear(gpib_board_t *board, int assert)
+static void hp_82341_interface_clear(gpib_board_t *board, int assert)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	tms9914_interface_clear(board, &priv->tms9914_priv, assert);
 }
 
-void hp_82341_remote_enable(gpib_board_t *board, int enable)
+static void hp_82341_remote_enable(gpib_board_t *board, int enable)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	tms9914_remote_enable(board, &priv->tms9914_priv, enable);
 }
 
-int hp_82341_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
+static int hp_82341_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	return tms9914_enable_eos(board, &priv->tms9914_priv, eos_byte, compare_8_bits);
 }
 
-void hp_82341_disable_eos(gpib_board_t *board)
+static void hp_82341_disable_eos(gpib_board_t *board)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	tms9914_disable_eos(board, &priv->tms9914_priv);
 }
 
-unsigned int hp_82341_update_status(gpib_board_t *board, unsigned int clear_mask)
+static unsigned int hp_82341_update_status(gpib_board_t *board, unsigned int clear_mask)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	return tms9914_update_status(board, &priv->tms9914_priv, clear_mask);
 }
 
-int hp_82341_primary_address(gpib_board_t *board, unsigned int address)
+static int hp_82341_primary_address(gpib_board_t *board, unsigned int address)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	return tms9914_primary_address(board, &priv->tms9914_priv, address);
 }
 
-int hp_82341_secondary_address(gpib_board_t *board, unsigned int address, int enable)
+static int hp_82341_secondary_address(gpib_board_t *board, unsigned int address, int enable)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	return tms9914_secondary_address(board, &priv->tms9914_priv, address, enable);
 }
 
-int hp_82341_parallel_poll(gpib_board_t *board, uint8_t *result)
+static int hp_82341_parallel_poll(gpib_board_t *board, uint8_t *result)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	return tms9914_parallel_poll(board, &priv->tms9914_priv, result);
 }
 
-void hp_82341_parallel_poll_configure(gpib_board_t *board, uint8_t config)
+static void hp_82341_parallel_poll_configure(gpib_board_t *board, uint8_t config)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	tms9914_parallel_poll_configure(board, &priv->tms9914_priv, config);
 }
 
-void hp_82341_parallel_poll_response(gpib_board_t *board, int ist)
+static void hp_82341_parallel_poll_response(gpib_board_t *board, int ist)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
 	tms9914_parallel_poll_response(board, &priv->tms9914_priv, ist);
 }
 
-void hp_82341_serial_poll_response(gpib_board_t *board, uint8_t status)
+static void hp_82341_serial_poll_response(gpib_board_t *board, uint8_t status)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -395,7 +404,7 @@ static unsigned int hp_82341_t1_delay(gpib_board_t *board, unsigned int nano_sec
 	return tms9914_t1_delay(board, &priv->tms9914_priv, nano_sec);
 }
 
-void hp_82341_return_to_local(gpib_board_t *board)
+static void hp_82341_return_to_local(gpib_board_t *board)
 {
 	struct hp_82341_priv *priv = board->private_data;
 
@@ -457,7 +466,7 @@ static gpib_interface_t hp_82341_interface = {
 	.return_to_local = hp_82341_return_to_local,
 };
 
-int hp_82341_allocate_private(gpib_board_t *board)
+static int hp_82341_allocate_private(gpib_board_t *board)
 {
 	board->private_data = kzalloc(sizeof(struct hp_82341_priv), GFP_KERNEL);
 	if (!board->private_data)
@@ -465,7 +474,7 @@ int hp_82341_allocate_private(gpib_board_t *board)
 	return 0;
 }
 
-void hp_82341_free_private(gpib_board_t *board)
+static void hp_82341_free_private(gpib_board_t *board)
 {
 	kfree(board->private_data);
 	board->private_data = NULL;
@@ -678,7 +687,7 @@ static int clear_xilinx(struct hp_82341_priv *hp_priv)
 	return 0;
 }
 
-int hp_82341_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int hp_82341_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	struct hp_82341_priv *hp_priv;
 	struct tms9914_priv *tms_priv;
@@ -774,7 +783,7 @@ int hp_82341_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	return 0;
 }
 
-void hp_82341_detach(gpib_board_t *board)
+static void hp_82341_detach(gpib_board_t *board)
 {
 	struct hp_82341_priv *hp_priv = board->private_data;
 	struct tms9914_priv *tms_priv;
@@ -837,7 +846,7 @@ module_exit(hp_82341_exit_module);
 /*
  * GPIB interrupt service routines
  */
-unsigned short read_and_clear_event_status(gpib_board_t *board)
+static unsigned short read_and_clear_event_status(gpib_board_t *board)
 {
 	struct hp_82341_priv *hp_priv = board->private_data;
 	unsigned long flags;
@@ -850,7 +859,7 @@ unsigned short read_and_clear_event_status(gpib_board_t *board)
 	return status;
 }
 
-irqreturn_t hp_82341_interrupt(int irq, void *arg)
+static irqreturn_t hp_82341_interrupt(int irq, void *arg)
 {
 	int status1, status2;
 	gpib_board_t *board = arg;
@@ -885,7 +894,7 @@ irqreturn_t hp_82341_interrupt(int irq, void *arg)
 	return retval;
 }
 
-int read_transfer_counter(struct hp_82341_priv *hp_priv)
+static int read_transfer_counter(struct hp_82341_priv *hp_priv)
 {
 	int lo, mid, value;
 
@@ -896,7 +905,7 @@ int read_transfer_counter(struct hp_82341_priv *hp_priv)
 	return value;
 }
 
-void set_transfer_counter(struct hp_82341_priv *hp_priv, int count)
+static void set_transfer_counter(struct hp_82341_priv *hp_priv, int count)
 {
 	int complement = -count;
 
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.h b/drivers/staging/gpib/hp_82341/hp_82341.h
index 0065ebd9747c..370a3d4576eb 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.h
+++ b/drivers/staging/gpib/hp_82341/hp_82341.h
@@ -26,42 +26,6 @@ struct hp_82341_priv {
 	enum hp_82341_hardware_version hw_version;
 };
 
-
-// interface functions
-int hp_82341_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
-			size_t *bytes_read);
-int hp_82341_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-			 size_t *bytes_written);
-int hp_82341_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
-		  size_t *bytes_read);
-int hp_82341_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-		   size_t *bytes_written);
-int hp_82341_command(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written);
-int hp_82341_take_control(gpib_board_t *board, int synchronous);
-int hp_82341_go_to_standby(gpib_board_t *board);
-void hp_82341_request_system_control(gpib_board_t *board, int request_control);
-void hp_82341_interface_clear(gpib_board_t *board, int assert);
-void hp_82341_remote_enable(gpib_board_t *board, int enable);
-int hp_82341_enable_eos(gpib_board_t *board, uint8_t eos_byte, int
-			compare_8_bits);
-void hp_82341_disable_eos(gpib_board_t *board);
-unsigned int hp_82341_update_status(gpib_board_t *board, unsigned int clear_mask);
-int hp_82341_primary_address(gpib_board_t *board, unsigned int address);
-int hp_82341_secondary_address(gpib_board_t *board, unsigned int address, int
-			enable);
-int hp_82341_parallel_poll(gpib_board_t *board, uint8_t *result);
-void hp_82341_parallel_poll_configure(gpib_board_t *board, uint8_t config);
-void hp_82341_parallel_poll_response(gpib_board_t *board, int ist);
-void hp_82341_serial_poll_response(gpib_board_t *board, uint8_t status);
-void hp_82341_return_to_local(gpib_board_t *board);
-
-// interrupt service routines
-irqreturn_t hp_82341_interrupt(int irq, void *arg);
-
-// utility functions
-int hp_82341_allocate_private(gpib_board_t *board);
-void hp_82341_free_private(gpib_board_t *board);
-
 static const int hp_82341_region_iosize = 0x8;
 static const int hp_82341_num_io_regions = 4;
 static const int hp_82341_fifo_size = 0xffe;
@@ -199,7 +163,3 @@ enum hp_82341d_pnp_pio_bits {
 	HP_82341D_LEGACY_MODE_BIT = 0x4,
 	HP_82341D_NOT_PROG_BIT = 0x8,	// clear to reinitialize xilinx
 };
-
-unsigned short read_and_clear_event_status(gpib_board_t *board);
-int read_transfer_counter(struct hp_82341_priv *hp_priv);
-void set_transfer_counter(struct hp_82341_priv *hp_priv, int count);
diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index c0b07cb63d9a..a92270d37594 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -49,15 +49,6 @@ static inline unsigned int CLEAR_INTR_REG(unsigned int irq)
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver for PC2/PC2a and compatible devices");
 
-static int pc2_attach(gpib_board_t *board, const gpib_board_config_t *config);
-static int pc2a_attach(gpib_board_t *board, const gpib_board_config_t *config);
-static int pc2a_cb7210_attach(gpib_board_t *board, const gpib_board_config_t *config);
-static int pc2_2a_attach(gpib_board_t *board, const gpib_board_config_t *config);
-
-static void pc2_detach(gpib_board_t *board);
-static void pc2a_detach(gpib_board_t *board);
-static void pc2_2a_detach(gpib_board_t *board);
-
 /*
  * GPIB interrupt service routines
  */
@@ -238,118 +229,6 @@ static void pc2_return_to_local(gpib_board_t *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static gpib_interface_t pc2_interface = {
-	.name =	"pcII",
-	.attach =	pc2_attach,
-	.detach =	pc2_detach,
-	.read =	pc2_read,
-	.write =	pc2_write,
-	.command =	pc2_command,
-	.take_control =	pc2_take_control,
-	.go_to_standby =	pc2_go_to_standby,
-	.request_system_control =	pc2_request_system_control,
-	.interface_clear =	pc2_interface_clear,
-	.remote_enable =	pc2_remote_enable,
-	.enable_eos =	pc2_enable_eos,
-	.disable_eos =	pc2_disable_eos,
-	.parallel_poll =	pc2_parallel_poll,
-	.parallel_poll_configure =	pc2_parallel_poll_configure,
-	.parallel_poll_response =	pc2_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status =	NULL,
-	.update_status =	pc2_update_status,
-	.primary_address =	pc2_primary_address,
-	.secondary_address =	pc2_secondary_address,
-	.serial_poll_response =	pc2_serial_poll_response,
-	.serial_poll_status =	pc2_serial_poll_status,
-	.t1_delay = pc2_t1_delay,
-	.return_to_local = pc2_return_to_local,
-};
-
-static gpib_interface_t pc2a_interface = {
-	.name =	"pcIIa",
-	.attach =	pc2a_attach,
-	.detach =	pc2a_detach,
-	.read =	pc2_read,
-	.write =	pc2_write,
-	.command =	pc2_command,
-	.take_control =	pc2_take_control,
-	.go_to_standby =	pc2_go_to_standby,
-	.request_system_control =	pc2_request_system_control,
-	.interface_clear =	pc2_interface_clear,
-	.remote_enable =	pc2_remote_enable,
-	.enable_eos =	pc2_enable_eos,
-	.disable_eos =	pc2_disable_eos,
-	.parallel_poll =	pc2_parallel_poll,
-	.parallel_poll_configure =	pc2_parallel_poll_configure,
-	.parallel_poll_response =	pc2_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status =	NULL,
-	.update_status =	pc2_update_status,
-	.primary_address =	pc2_primary_address,
-	.secondary_address =	pc2_secondary_address,
-	.serial_poll_response =	pc2_serial_poll_response,
-	.serial_poll_status =	pc2_serial_poll_status,
-	.t1_delay = pc2_t1_delay,
-	.return_to_local = pc2_return_to_local,
-};
-
-static gpib_interface_t pc2a_cb7210_interface = {
-	.name =	"pcIIa_cb7210",
-	.attach =	pc2a_cb7210_attach,
-	.detach =	pc2a_detach,
-	.read =	pc2_read,
-	.write =	pc2_write,
-	.command =	pc2_command,
-	.take_control =	pc2_take_control,
-	.go_to_standby =	pc2_go_to_standby,
-	.request_system_control =	pc2_request_system_control,
-	.interface_clear =	pc2_interface_clear,
-	.remote_enable =	pc2_remote_enable,
-	.enable_eos =	pc2_enable_eos,
-	.disable_eos =	pc2_disable_eos,
-	.parallel_poll =	pc2_parallel_poll,
-	.parallel_poll_configure =	pc2_parallel_poll_configure,
-	.parallel_poll_response =	pc2_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status =	NULL, //XXX
-	.update_status =	pc2_update_status,
-	.primary_address =	pc2_primary_address,
-	.secondary_address =	pc2_secondary_address,
-	.serial_poll_response =	pc2_serial_poll_response,
-	.serial_poll_status =	pc2_serial_poll_status,
-	.t1_delay = pc2_t1_delay,
-	.return_to_local = pc2_return_to_local,
-};
-
-static gpib_interface_t pc2_2a_interface = {
-	.name =	"pcII_IIa",
-	.attach =	pc2_2a_attach,
-	.detach =	pc2_2a_detach,
-	.read =	pc2_read,
-	.write =	pc2_write,
-	.command =	pc2_command,
-	.take_control =	pc2_take_control,
-	.go_to_standby =	pc2_go_to_standby,
-	.request_system_control =	pc2_request_system_control,
-	.interface_clear =	pc2_interface_clear,
-	.remote_enable =	pc2_remote_enable,
-	.enable_eos =	pc2_enable_eos,
-	.disable_eos =	pc2_disable_eos,
-	.parallel_poll =	pc2_parallel_poll,
-	.parallel_poll_configure =	pc2_parallel_poll_configure,
-	.parallel_poll_response =	pc2_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status =	NULL,
-	.update_status =	pc2_update_status,
-	.primary_address =	pc2_primary_address,
-	.secondary_address =	pc2_secondary_address,
-	.serial_poll_response =	pc2_serial_poll_response,
-	.serial_poll_status =	pc2_serial_poll_status,
-	.t1_delay = pc2_t1_delay,
-	.return_to_local = pc2_return_to_local,
-};
-
 static int allocate_private(gpib_board_t *board)
 {
 	struct pc2_priv *priv;
@@ -411,7 +290,7 @@ static int pc2_generic_attach(gpib_board_t *board, const gpib_board_config_t *co
 	return 0;
 }
 
-int pc2_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int pc2_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	int isr_flags = 0;
 	struct pc2_priv *pc2_priv;
@@ -455,7 +334,7 @@ int pc2_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	return 0;
 }
 
-void pc2_detach(gpib_board_t *board)
+static void pc2_detach(gpib_board_t *board)
 {
 	struct pc2_priv *pc2_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
@@ -575,17 +454,17 @@ static int pc2a_common_attach(gpib_board_t *board, const gpib_board_config_t *co
 	return 0;
 }
 
-int pc2a_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int pc2a_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	return pc2a_common_attach(board, config, pc2a_iosize, NEC7210);
 }
 
-int pc2a_cb7210_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int pc2a_cb7210_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	return pc2a_common_attach(board, config, pc2a_iosize, CB7210);
 }
 
-int pc2_2a_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int pc2_2a_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	return pc2a_common_attach(board, config, pc2_2a_iosize, NAT4882);
 }
@@ -623,16 +502,128 @@ static void pc2a_common_detach(gpib_board_t *board, unsigned int num_registers)
 	free_private(board);
 }
 
-void pc2a_detach(gpib_board_t *board)
+static void pc2a_detach(gpib_board_t *board)
 {
 	pc2a_common_detach(board, pc2a_iosize);
 }
 
-void pc2_2a_detach(gpib_board_t *board)
+static void pc2_2a_detach(gpib_board_t *board)
 {
 	pc2a_common_detach(board, pc2_2a_iosize);
 }
 
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
+};
+
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
+};
+
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
+};
+
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
+};
+
 static int __init pc2_init_module(void)
 {
 	int ret;
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index b39ab2abe495..2e1c3cbebaca 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -47,49 +47,7 @@ struct tnt4882_priv {
 	unsigned short auxg_bits;	// bits written to auxiliary register G
 };
 
-// interface functions
-static int tnt4882_read(gpib_board_t *board, uint8_t *buffer, size_t length,
-			int *end, size_t *bytes_read);
-static int tnt4882_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length,
-			      int *end, size_t *bytes_read);
-static int tnt4882_write(gpib_board_t *board, uint8_t *buffer, size_t length,
-			 int send_eoi, size_t *bytes_written);
-static int tnt4882_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length,
-			       int send_eoi, size_t *bytes_written);
-static int tnt4882_command(gpib_board_t *board, uint8_t *buffer, size_t length,
-			   size_t *bytes_written);
-static int tnt4882_command_unaccel(gpib_board_t *board, uint8_t *buffer,
-				   size_t length, size_t *bytes_written);
-static int tnt4882_take_control(gpib_board_t *board, int synchronous);
-static int tnt4882_go_to_standby(gpib_board_t *board);
-static void tnt4882_request_system_control(gpib_board_t *board, int request_control);
-static void tnt4882_interface_clear(gpib_board_t *board, int assert);
-static void tnt4882_remote_enable(gpib_board_t *board, int enable);
-static int tnt4882_enable_eos(gpib_board_t *board, uint8_t eos_byte, int
-			      compare_8_bits);
-static void tnt4882_disable_eos(gpib_board_t *board);
-static unsigned int tnt4882_update_status(gpib_board_t *board, unsigned int clear_mask);
-static int tnt4882_primary_address(gpib_board_t *board, unsigned int address);
-static int tnt4882_secondary_address(gpib_board_t *board, unsigned int address,
-				     int enable);
-static int tnt4882_parallel_poll(gpib_board_t *board, uint8_t *result);
-static void tnt4882_parallel_poll_configure(gpib_board_t *board, uint8_t config);
-static void tnt4882_parallel_poll_response(gpib_board_t *board, int ist);
-static void tnt4882_serial_poll_response(gpib_board_t *board, uint8_t status);
-static uint8_t tnt4882_serial_poll_status(gpib_board_t *board);
-static int tnt4882_line_status(const gpib_board_t *board);
-static unsigned int tnt4882_t1_delay(gpib_board_t *board, unsigned int nano_sec);
-static void tnt4882_return_to_local(gpib_board_t *board);
-
-// interrupt service routines
 static irqreturn_t tnt4882_internal_interrupt(gpib_board_t *board);
-static irqreturn_t tnt4882_interrupt(int irq, void *arg);
-
-// utility functions
-static int tnt4882_allocate_private(gpib_board_t *board);
-static void tnt4882_free_private(gpib_board_t *board);
-static void tnt4882_init(struct tnt4882_priv *tnt_priv, const gpib_board_t *board);
-static void tnt4882_board_reset(struct tnt4882_priv *tnt_priv, gpib_board_t *board);
 
 // register offset for nec7210 compatible registers
 static const int atgpib_reg_offset = 2;
@@ -188,7 +146,7 @@ static inline void tnt_writeb(struct tnt4882_priv *priv, unsigned short value, u
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GPIB driver for National Instruments boards using tnt4882 or compatible chips");
 
-int tnt4882_line_status(const gpib_board_t *board)
+static int tnt4882_line_status(const gpib_board_t *board)
 {
 	int status = ValidALL;
 	int bcsr_bits;
@@ -218,7 +176,7 @@ int tnt4882_line_status(const gpib_board_t *board)
 	return status;
 }
 
-unsigned int tnt4882_t1_delay(gpib_board_t *board, unsigned int nano_sec)
+static unsigned int tnt4882_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 	struct nec7210_priv *nec_priv = &tnt_priv->nec7210_priv;
@@ -314,8 +272,8 @@ static void tnt4882_release_holdoff(gpib_board_t *board, struct tnt4882_priv *tn
 	}
 }
 
-int tnt4882_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
-		       size_t *bytes_read)
+static int tnt4882_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
+			      size_t *bytes_read)
 {
 	size_t count = 0;
 	ssize_t retval = 0;
@@ -596,18 +554,19 @@ static int generic_write(gpib_board_t *board, uint8_t *buffer, size_t length,
 	return retval;
 }
 
-int tnt4882_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-			size_t *bytes_written)
+static int tnt4882_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+			       size_t *bytes_written)
 {
 	return generic_write(board, buffer, length, send_eoi, 0, bytes_written);
 }
 
-int tnt4882_command(gpib_board_t *board, uint8_t *buffer, size_t length, size_t *bytes_written)
+static int tnt4882_command(gpib_board_t *board, uint8_t *buffer, size_t length,
+			   size_t *bytes_written)
 {
 	return generic_write(board, buffer, length, 0, 1, bytes_written);
 }
 
-irqreturn_t tnt4882_internal_interrupt(gpib_board_t *board)
+static irqreturn_t tnt4882_internal_interrupt(gpib_board_t *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 	int isr0_bits, isr3_bits, imr3_bits;
@@ -642,28 +601,14 @@ irqreturn_t tnt4882_internal_interrupt(gpib_board_t *board)
 	return IRQ_HANDLED;
 }
 
-irqreturn_t tnt4882_interrupt(int irq, void *arg)
+static irqreturn_t tnt4882_interrupt(int irq, void *arg)
 {
 	return tnt4882_internal_interrupt(arg);
 }
 
-static int ni_tnt_isa_attach(gpib_board_t *board, const gpib_board_config_t *config);
-static int ni_nat4882_isa_attach(gpib_board_t *board, const gpib_board_config_t *config);
-static int ni_nec_isa_attach(gpib_board_t *board, const gpib_board_config_t *config);
-static int ni_pci_attach(gpib_board_t *board, const gpib_board_config_t *config);
-
-static void ni_isa_detach(gpib_board_t *board);
-static void ni_pci_detach(gpib_board_t *board);
-
-#ifdef GPIB_PCMCIA
-static int ni_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config);
-static void ni_pcmcia_detach(gpib_board_t *board);
-static int init_ni_gpib_cs(void);
-static void __exit exit_ni_gpib_cs(void);
-#endif
-
 // wrappers for interface functions
-int tnt4882_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end, size_t *bytes_read)
+static int tnt4882_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
+			size_t *bytes_read)
 {
 	struct tnt4882_priv *priv = board->private_data;
 	struct nec7210_priv *nec_priv = &priv->nec7210_priv;
@@ -682,37 +627,37 @@ int tnt4882_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
 	return retval;
 }
 
-int tnt4882_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
-		  size_t *bytes_written)
+static int tnt4882_write(gpib_board_t *board, uint8_t *buffer, size_t length, int send_eoi,
+			 size_t *bytes_written)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_write(board, &priv->nec7210_priv, buffer, length, send_eoi, bytes_written);
 }
 
-int tnt4882_command_unaccel(gpib_board_t *board, uint8_t *buffer,
-			    size_t length, size_t *bytes_written)
+static int tnt4882_command_unaccel(gpib_board_t *board, uint8_t *buffer,
+				   size_t length, size_t *bytes_written)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_command(board, &priv->nec7210_priv, buffer, length, bytes_written);
 }
 
-int tnt4882_take_control(gpib_board_t *board, int synchronous)
+static int tnt4882_take_control(gpib_board_t *board, int synchronous)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_take_control(board, &priv->nec7210_priv, synchronous);
 }
 
-int tnt4882_go_to_standby(gpib_board_t *board)
+static int tnt4882_go_to_standby(gpib_board_t *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-void tnt4882_request_system_control(gpib_board_t *board, int request_control)
+static void tnt4882_request_system_control(gpib_board_t *board, int request_control)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -727,35 +672,35 @@ void tnt4882_request_system_control(gpib_board_t *board, int request_control)
 	}
 }
 
-void tnt4882_interface_clear(gpib_board_t *board, int assert)
+static void tnt4882_interface_clear(gpib_board_t *board, int assert)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	nec7210_interface_clear(board, &priv->nec7210_priv, assert);
 }
 
-void tnt4882_remote_enable(gpib_board_t *board, int enable)
+static void tnt4882_remote_enable(gpib_board_t *board, int enable)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	nec7210_remote_enable(board, &priv->nec7210_priv, enable);
 }
 
-int tnt4882_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
+static int tnt4882_enable_eos(gpib_board_t *board, uint8_t eos_byte, int compare_8_bits)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_enable_eos(board, &priv->nec7210_priv, eos_byte, compare_8_bits);
 }
 
-void tnt4882_disable_eos(gpib_board_t *board)
+static void tnt4882_disable_eos(gpib_board_t *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	nec7210_disable_eos(board, &priv->nec7210_priv);
 }
 
-unsigned int tnt4882_update_status(gpib_board_t *board, unsigned int clear_mask)
+static unsigned int tnt4882_update_status(gpib_board_t *board, unsigned int clear_mask)
 {
 	unsigned long flags;
 	u8 line_status;
@@ -775,22 +720,21 @@ unsigned int tnt4882_update_status(gpib_board_t *board, unsigned int clear_mask)
 	return board->status;
 }
 
-int tnt4882_primary_address(gpib_board_t *board, unsigned int address)
+static int tnt4882_primary_address(gpib_board_t *board, unsigned int address)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_primary_address(board, &priv->nec7210_priv, address);
 }
 
-int tnt4882_secondary_address(gpib_board_t *board, unsigned int address, int enable)
+static int tnt4882_secondary_address(gpib_board_t *board, unsigned int address, int enable)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_secondary_address(board, &priv->nec7210_priv, address, enable);
 }
 
-int tnt4882_parallel_poll(gpib_board_t *board, uint8_t *result)
-
+static int tnt4882_parallel_poll(gpib_board_t *board, uint8_t *result)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 
@@ -807,7 +751,7 @@ int tnt4882_parallel_poll(gpib_board_t *board, uint8_t *result)
 	}
 }
 
-void tnt4882_parallel_poll_configure(gpib_board_t *board, uint8_t config)
+static void tnt4882_parallel_poll_configure(gpib_board_t *board, uint8_t config)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -825,7 +769,7 @@ void tnt4882_parallel_poll_configure(gpib_board_t *board, uint8_t config)
 	}
 }
 
-void tnt4882_parallel_poll_response(gpib_board_t *board, int ist)
+static void tnt4882_parallel_poll_response(gpib_board_t *board, int ist)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -835,7 +779,7 @@ void tnt4882_parallel_poll_response(gpib_board_t *board, int ist)
 /* this is just used by the old nec7210 isa interfaces, the newer
  * boards use tnt4882_serial_poll_response2
  */
-void tnt4882_serial_poll_response(gpib_board_t *board, uint8_t status)
+static void tnt4882_serial_poll_response(gpib_board_t *board, uint8_t status)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
@@ -876,303 +820,21 @@ static void tnt4882_serial_poll_response2(gpib_board_t *board, uint8_t status,
 	spin_unlock_irqrestore(&board->spinlock, flags);
 }
 
-uint8_t tnt4882_serial_poll_status(gpib_board_t *board)
+static uint8_t tnt4882_serial_poll_status(gpib_board_t *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	return nec7210_serial_poll_status(board, &priv->nec7210_priv);
 }
 
-void tnt4882_return_to_local(gpib_board_t *board)
+static void tnt4882_return_to_local(gpib_board_t *board)
 {
 	struct tnt4882_priv *priv = board->private_data;
 
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static gpib_interface_t ni_pci_interface = {
-	.name = "ni_pci",
-	.attach = ni_pci_attach,
-	.detach = ni_pci_detach,
-	.read = tnt4882_accel_read,
-	.write = tnt4882_accel_write,
-	.command = tnt4882_command,
-	.take_control = tnt4882_take_control,
-	.go_to_standby = tnt4882_go_to_standby,
-	.request_system_control = tnt4882_request_system_control,
-	.interface_clear = tnt4882_interface_clear,
-	.remote_enable = tnt4882_remote_enable,
-	.enable_eos = tnt4882_enable_eos,
-	.disable_eos = tnt4882_disable_eos,
-	.parallel_poll = tnt4882_parallel_poll,
-	.parallel_poll_configure = tnt4882_parallel_poll_configure,
-	.parallel_poll_response = tnt4882_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status = tnt4882_line_status,
-	.update_status = tnt4882_update_status,
-	.primary_address = tnt4882_primary_address,
-	.secondary_address = tnt4882_secondary_address,
-	.serial_poll_response2 = tnt4882_serial_poll_response2,
-	.serial_poll_status = tnt4882_serial_poll_status,
-	.t1_delay = tnt4882_t1_delay,
-	.return_to_local = tnt4882_return_to_local,
-};
-
-static gpib_interface_t ni_pci_accel_interface = {
-	.name = "ni_pci_accel",
-	.attach = ni_pci_attach,
-	.detach = ni_pci_detach,
-	.read = tnt4882_accel_read,
-	.write = tnt4882_accel_write,
-	.command = tnt4882_command,
-	.take_control = tnt4882_take_control,
-	.go_to_standby = tnt4882_go_to_standby,
-	.request_system_control = tnt4882_request_system_control,
-	.interface_clear = tnt4882_interface_clear,
-	.remote_enable = tnt4882_remote_enable,
-	.enable_eos = tnt4882_enable_eos,
-	.disable_eos = tnt4882_disable_eos,
-	.parallel_poll = tnt4882_parallel_poll,
-	.parallel_poll_configure = tnt4882_parallel_poll_configure,
-	.parallel_poll_response = tnt4882_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status = tnt4882_line_status,
-	.update_status = tnt4882_update_status,
-	.primary_address = tnt4882_primary_address,
-	.secondary_address = tnt4882_secondary_address,
-	.serial_poll_response2 = tnt4882_serial_poll_response2,
-	.serial_poll_status = tnt4882_serial_poll_status,
-	.t1_delay = tnt4882_t1_delay,
-	.return_to_local = tnt4882_return_to_local,
-};
-
-static gpib_interface_t ni_isa_interface = {
-	.name = "ni_isa",
-	.attach = ni_tnt_isa_attach,
-	.detach = ni_isa_detach,
-	.read = tnt4882_accel_read,
-	.write = tnt4882_accel_write,
-	.command = tnt4882_command,
-	.take_control = tnt4882_take_control,
-	.go_to_standby = tnt4882_go_to_standby,
-	.request_system_control = tnt4882_request_system_control,
-	.interface_clear = tnt4882_interface_clear,
-	.remote_enable = tnt4882_remote_enable,
-	.enable_eos = tnt4882_enable_eos,
-	.disable_eos = tnt4882_disable_eos,
-	.parallel_poll = tnt4882_parallel_poll,
-	.parallel_poll_configure = tnt4882_parallel_poll_configure,
-	.parallel_poll_response = tnt4882_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status = tnt4882_line_status,
-	.update_status = tnt4882_update_status,
-	.primary_address = tnt4882_primary_address,
-	.secondary_address = tnt4882_secondary_address,
-	.serial_poll_response2 = tnt4882_serial_poll_response2,
-	.serial_poll_status = tnt4882_serial_poll_status,
-	.t1_delay = tnt4882_t1_delay,
-	.return_to_local = tnt4882_return_to_local,
-};
-
-static gpib_interface_t ni_nat4882_isa_interface = {
-	.name = "ni_nat4882_isa",
-	.attach = ni_nat4882_isa_attach,
-	.detach = ni_isa_detach,
-	.read = tnt4882_read,
-	.write = tnt4882_write,
-	.command = tnt4882_command_unaccel,
-	.take_control = tnt4882_take_control,
-	.go_to_standby = tnt4882_go_to_standby,
-	.request_system_control = tnt4882_request_system_control,
-	.interface_clear = tnt4882_interface_clear,
-	.remote_enable = tnt4882_remote_enable,
-	.enable_eos = tnt4882_enable_eos,
-	.disable_eos = tnt4882_disable_eos,
-	.parallel_poll = tnt4882_parallel_poll,
-	.parallel_poll_configure = tnt4882_parallel_poll_configure,
-	.parallel_poll_response = tnt4882_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status = tnt4882_line_status,
-	.update_status = tnt4882_update_status,
-	.primary_address = tnt4882_primary_address,
-	.secondary_address = tnt4882_secondary_address,
-	.serial_poll_response2 = tnt4882_serial_poll_response2,
-	.serial_poll_status = tnt4882_serial_poll_status,
-	.t1_delay = tnt4882_t1_delay,
-	.return_to_local = tnt4882_return_to_local,
-};
-
-static gpib_interface_t ni_nec_isa_interface = {
-	.name = "ni_nec_isa",
-	.attach = ni_nec_isa_attach,
-	.detach = ni_isa_detach,
-	.read = tnt4882_read,
-	.write = tnt4882_write,
-	.command = tnt4882_command_unaccel,
-	.take_control = tnt4882_take_control,
-	.go_to_standby = tnt4882_go_to_standby,
-	.request_system_control = tnt4882_request_system_control,
-	.interface_clear = tnt4882_interface_clear,
-	.remote_enable = tnt4882_remote_enable,
-	.enable_eos = tnt4882_enable_eos,
-	.disable_eos = tnt4882_disable_eos,
-	.parallel_poll = tnt4882_parallel_poll,
-	.parallel_poll_configure = tnt4882_parallel_poll_configure,
-	.parallel_poll_response = tnt4882_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status = NULL,
-	.update_status = tnt4882_update_status,
-	.primary_address = tnt4882_primary_address,
-	.secondary_address = tnt4882_secondary_address,
-	.serial_poll_response = tnt4882_serial_poll_response,
-	.serial_poll_status = tnt4882_serial_poll_status,
-	.t1_delay = tnt4882_t1_delay,
-	.return_to_local = tnt4882_return_to_local,
-};
-
-static gpib_interface_t ni_isa_accel_interface = {
-	.name = "ni_isa_accel",
-	.attach = ni_tnt_isa_attach,
-	.detach = ni_isa_detach,
-	.read = tnt4882_accel_read,
-	.write = tnt4882_accel_write,
-	.command = tnt4882_command,
-	.take_control = tnt4882_take_control,
-	.go_to_standby = tnt4882_go_to_standby,
-	.request_system_control = tnt4882_request_system_control,
-	.interface_clear = tnt4882_interface_clear,
-	.remote_enable = tnt4882_remote_enable,
-	.enable_eos = tnt4882_enable_eos,
-	.disable_eos = tnt4882_disable_eos,
-	.parallel_poll = tnt4882_parallel_poll,
-	.parallel_poll_configure = tnt4882_parallel_poll_configure,
-	.parallel_poll_response = tnt4882_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status = tnt4882_line_status,
-	.update_status = tnt4882_update_status,
-	.primary_address = tnt4882_primary_address,
-	.secondary_address = tnt4882_secondary_address,
-	.serial_poll_response2 = tnt4882_serial_poll_response2,
-	.serial_poll_status = tnt4882_serial_poll_status,
-	.t1_delay = tnt4882_t1_delay,
-	.return_to_local = tnt4882_return_to_local,
-};
-
-static gpib_interface_t ni_nat4882_isa_accel_interface = {
-	.name = "ni_nat4882_isa_accel",
-	.attach = ni_nat4882_isa_attach,
-	.detach = ni_isa_detach,
-	.read = tnt4882_accel_read,
-	.write = tnt4882_accel_write,
-	.command = tnt4882_command_unaccel,
-	.take_control = tnt4882_take_control,
-	.go_to_standby = tnt4882_go_to_standby,
-	.request_system_control = tnt4882_request_system_control,
-	.interface_clear = tnt4882_interface_clear,
-	.remote_enable = tnt4882_remote_enable,
-	.enable_eos = tnt4882_enable_eos,
-	.disable_eos = tnt4882_disable_eos,
-	.parallel_poll = tnt4882_parallel_poll,
-	.parallel_poll_configure = tnt4882_parallel_poll_configure,
-	.parallel_poll_response = tnt4882_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status = tnt4882_line_status,
-	.update_status = tnt4882_update_status,
-	.primary_address = tnt4882_primary_address,
-	.secondary_address = tnt4882_secondary_address,
-	.serial_poll_response2 = tnt4882_serial_poll_response2,
-	.serial_poll_status = tnt4882_serial_poll_status,
-	.t1_delay = tnt4882_t1_delay,
-	.return_to_local = tnt4882_return_to_local,
-};
-
-static gpib_interface_t ni_nec_isa_accel_interface = {
-	.name = "ni_nec_isa_accel",
-	.attach = ni_nec_isa_attach,
-	.detach = ni_isa_detach,
-	.read = tnt4882_accel_read,
-	.write = tnt4882_accel_write,
-	.command = tnt4882_command_unaccel,
-	.take_control = tnt4882_take_control,
-	.go_to_standby = tnt4882_go_to_standby,
-	.request_system_control = tnt4882_request_system_control,
-	.interface_clear = tnt4882_interface_clear,
-	.remote_enable = tnt4882_remote_enable,
-	.enable_eos = tnt4882_enable_eos,
-	.disable_eos = tnt4882_disable_eos,
-	.parallel_poll = tnt4882_parallel_poll,
-	.parallel_poll_configure = tnt4882_parallel_poll_configure,
-	.parallel_poll_response = tnt4882_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status = NULL,
-	.update_status = tnt4882_update_status,
-	.primary_address = tnt4882_primary_address,
-	.secondary_address = tnt4882_secondary_address,
-	.serial_poll_response = tnt4882_serial_poll_response,
-	.serial_poll_status = tnt4882_serial_poll_status,
-	.t1_delay = tnt4882_t1_delay,
-	.return_to_local = tnt4882_return_to_local,
-};
-
-#ifdef GPIB_PCMCIA
-static gpib_interface_t ni_pcmcia_interface = {
-	.name = "ni_pcmcia",
-	.attach = ni_pcmcia_attach,
-	.detach = ni_pcmcia_detach,
-	.read = tnt4882_accel_read,
-	.write = tnt4882_accel_write,
-	.command = tnt4882_command,
-	.take_control = tnt4882_take_control,
-	.go_to_standby = tnt4882_go_to_standby,
-	.request_system_control = tnt4882_request_system_control,
-	.interface_clear = tnt4882_interface_clear,
-	.remote_enable = tnt4882_remote_enable,
-	.enable_eos = tnt4882_enable_eos,
-	.disable_eos = tnt4882_disable_eos,
-	.parallel_poll = tnt4882_parallel_poll,
-	.parallel_poll_configure = tnt4882_parallel_poll_configure,
-	.parallel_poll_response = tnt4882_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status = tnt4882_line_status,
-	.update_status = tnt4882_update_status,
-	.primary_address = tnt4882_primary_address,
-	.secondary_address = tnt4882_secondary_address,
-	.serial_poll_response = tnt4882_serial_poll_response,
-	.serial_poll_status = tnt4882_serial_poll_status,
-	.t1_delay = tnt4882_t1_delay,
-	.return_to_local = tnt4882_return_to_local,
-};
-
-static gpib_interface_t ni_pcmcia_accel_interface = {
-	.name = "ni_pcmcia_accel",
-	.attach = ni_pcmcia_attach,
-	.detach = ni_pcmcia_detach,
-	.read = tnt4882_accel_read,
-	.write = tnt4882_accel_write,
-	.command = tnt4882_command,
-	.take_control = tnt4882_take_control,
-	.go_to_standby = tnt4882_go_to_standby,
-	.request_system_control = tnt4882_request_system_control,
-	.interface_clear = tnt4882_interface_clear,
-	.remote_enable = tnt4882_remote_enable,
-	.enable_eos = tnt4882_enable_eos,
-	.disable_eos = tnt4882_disable_eos,
-	.parallel_poll = tnt4882_parallel_poll,
-	.parallel_poll_configure = tnt4882_parallel_poll_configure,
-	.parallel_poll_response = tnt4882_parallel_poll_response,
-	.local_parallel_poll_mode = NULL, // XXX
-	.line_status = tnt4882_line_status,
-	.update_status = tnt4882_update_status,
-	.primary_address = tnt4882_primary_address,
-	.secondary_address = tnt4882_secondary_address,
-	.serial_poll_response = tnt4882_serial_poll_response,
-	.serial_poll_status = tnt4882_serial_poll_status,
-	.t1_delay = tnt4882_t1_delay,
-	.return_to_local = tnt4882_return_to_local,
-};
-#endif
-
-void tnt4882_board_reset(struct tnt4882_priv *tnt_priv, gpib_board_t *board)
+static void tnt4882_board_reset(struct tnt4882_priv *tnt_priv, gpib_board_t *board)
 {
 	struct nec7210_priv *nec_priv = &tnt_priv->nec7210_priv;
 
@@ -1185,7 +847,7 @@ void tnt4882_board_reset(struct tnt4882_priv *tnt_priv, gpib_board_t *board)
 	nec7210_board_reset(nec_priv, board);
 }
 
-int tnt4882_allocate_private(gpib_board_t *board)
+static int tnt4882_allocate_private(gpib_board_t *board)
 {
 	struct tnt4882_priv *tnt_priv;
 
@@ -1198,13 +860,13 @@ int tnt4882_allocate_private(gpib_board_t *board)
 	return 0;
 }
 
-void tnt4882_free_private(gpib_board_t *board)
+static void tnt4882_free_private(gpib_board_t *board)
 {
 	kfree(board->private_data);
 	board->private_data = NULL;
 }
 
-void tnt4882_init(struct tnt4882_priv *tnt_priv, const gpib_board_t *board)
+static void tnt4882_init(struct tnt4882_priv *tnt_priv, const gpib_board_t *board)
 {
 	struct nec7210_priv *nec_priv = &tnt_priv->nec7210_priv;
 
@@ -1252,7 +914,7 @@ void tnt4882_init(struct tnt4882_priv *tnt_priv, const gpib_board_t *board)
 	tnt_writeb(tnt_priv, tnt_priv->imr0_bits, IMR0);
 }
 
-int ni_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int ni_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	struct tnt4882_priv *tnt_priv;
 	struct nec7210_priv *nec_priv;
@@ -1343,7 +1005,7 @@ int ni_pci_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	return 0;
 }
 
-void ni_pci_detach(gpib_board_t *board)
+static void ni_pci_detach(gpib_board_t *board)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
@@ -1442,22 +1104,22 @@ static int ni_isa_attach_common(gpib_board_t *board, const gpib_board_config_t *
 	return 0;
 }
 
-int ni_tnt_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int ni_tnt_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	return ni_isa_attach_common(board, config, TNT4882);
 }
 
-int ni_nat4882_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int ni_nat4882_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	return ni_isa_attach_common(board, config, NAT4882);
 }
 
-int ni_nec_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int ni_nec_isa_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	return ni_isa_attach_common(board, config, NEC7210);
 }
 
-void ni_isa_detach(gpib_board_t *board)
+static void ni_isa_detach(gpib_board_t *board)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
@@ -1483,6 +1145,230 @@ static int tnt4882_pci_probe(struct pci_dev *dev, const struct pci_device_id *id
 	return 0;
 }
 
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
+};
+
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
+};
+
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
+};
+
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
+};
+
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
+};
+
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
+};
+
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
+};
+
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
+};
+
 static const struct pci_device_id tnt4882_pci_table[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_NATINST, PCI_DEVICE_ID_NI_GPIB)},
 	{PCI_DEVICE(PCI_VENDOR_ID_NATINST, PCI_DEVICE_ID_NI_GPIB_PLUS)},
@@ -1510,6 +1396,13 @@ static const struct pnp_device_id tnt4882_pnp_table[] = {
 };
 MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
 
+#ifdef GPIB_PCMCIA
+static gpib_interface_t ni_pcmcia_interface;
+static gpib_interface_t ni_pcmcia_accel_interface;
+static int __init init_ni_gpib_cs(void);
+static void __exit exit_ni_gpib_cs(void);
+#endif
+
 static int __init tnt4882_init_module(void)
 {
 	int result;
@@ -1676,7 +1569,6 @@ module_param(pc_debug, int, 0);
 
 static int ni_gpib_config(struct pcmcia_device  *link);
 static void ni_gpib_release(struct pcmcia_device *link);
-static int ni_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config);
 static void ni_pcmcia_detach(gpib_board_t *board);
 
 /*
@@ -1854,12 +1746,12 @@ static struct pcmcia_driver ni_gpib_cs_driver = {
 	.resume		= ni_gpib_resume,
 };
 
-int __init init_ni_gpib_cs(void)
+static int __init init_ni_gpib_cs(void)
 {
 	return pcmcia_register_driver(&ni_gpib_cs_driver);
 }
 
-void __exit exit_ni_gpib_cs(void)
+static void __exit exit_ni_gpib_cs(void)
 {
 	DEBUG(0, "ni_gpib_cs: unloading\n");
 	pcmcia_unregister_driver(&ni_gpib_cs_driver);
@@ -1867,7 +1759,7 @@ void __exit exit_ni_gpib_cs(void)
 
 static const int pcmcia_gpib_iosize = 32;
 
-int ni_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config)
+static int ni_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config)
 {
 	struct local_info_t *info;
 	struct tnt4882_priv *tnt_priv;
@@ -1920,7 +1812,7 @@ int ni_pcmcia_attach(gpib_board_t *board, const gpib_board_config_t *config)
 	return 0;
 }
 
-void ni_pcmcia_detach(gpib_board_t *board)
+static void ni_pcmcia_detach(gpib_board_t *board)
 {
 	struct tnt4882_priv *tnt_priv = board->private_data;
 	struct nec7210_priv *nec_priv;
@@ -1941,6 +1833,62 @@ void ni_pcmcia_detach(gpib_board_t *board)
 	tnt4882_free_private(board);
 }
 
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
+};
+
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
+};
+
 #endif	// GPIB_PCMCIA
 
 module_init(tnt4882_init_module);
-- 
2.47.1

