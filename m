Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613681;
	b=qtLj0KrmiV9WhtbdAJPZU944IH7weGWd/n6R4DEa8CMH3cZr0YhXLh77B8QRsFg6bUVZ
	 17YXjEkRvgZbXWOjR7apZZINHg2wSL8Jr5AXlq5e2xfiAk+OtM7pykzCT+faG2Xah4sat
	 3V2dKuRilrBl3GT3LaUwntGVuX7QWae2lLeZYScRE9GiqaxQuxt6Y/ivBRmq2VFpeh59e
	 h1yfe/NBk1y/c5nxUJVXakuoCVg5f9oPaGtm76WxsR3zDW0Onw4KKb5O8gnBkInN/iUsM
	 uGL7CLMegcHuPxzTaeXxsv9HiKN1lvxIm35S1XJLurpNJ5tpbESAIoHrqhbIb/5tKHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613681;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XAsSJNfTx4xhfOoXkTkpm3mX3Z/RpG+PiPXGvL3JZzs=;
	b=ILB/o0CvBCCeIBIRPeuNghBsHKutGVCin8EEnk7g+mt5PxHs6jrYItFZLcObCTvhQtAk
	 LptkwJ3dxM7ACg29IQcecTwG0+XpT8wlPGAWmRgf+Cv9PF4fSmvNaOiePAlmG6LS1LpkJ
	 eAVVuvWZXqNGlqlDeWKTCa4gsdMkQuxPhuIGXJ8OHy97JhKDUEzlazt831OxJvt7WzsLJ
	 swcLy83u+QlKYKgYSzvd6mzrhdH5Rp+whpIlA5E72Ei1r6AvtWgIqEJ7t8LY9ydds/jr3
	 q0KbLuWGRoS13c0uGzixMUk2UPo4hchv/6RHIO5QWYJjjyx/k3090jm3lv/zSPmn5KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=imeECTd5;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CA5606A332
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 23:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7CA5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=imeECTd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=imeECTd58AxEo9BWsUiwkbbdek7fBVIPutb742Y5F7i47S2xSl9lklGoLXERF5v8hgJ48bakuUonH
	 6f2OCqiez55Rb2wKk8BrXtWqt8x6mt5MoTx0p9GrfrYHx0QPiH3pEcoaARQ52vMpT3LjlKg4bU4D4x
	 DAMF2ylxXUKHjdGw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af7a1aabc5-ef701;
	Sat, 14 Nov 2026 07:47:56 +0800 (CST)
X-RM-TRANSID:2ee76af7a1aabc5-ef701
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[112.23.72.224])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16af7a19cd45-3375b;
	Sat, 14 Nov 2026 07:47:56 +0800 (CST)
X-RM-TRANSID:2ee16af7a19cd45-3375b
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: dan@pereq.eu
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v3] greybus: verify the received message size covers the message header
Date: Fri, 13 Nov 2026 23:47:39 +0000
Message-ID: <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avV8I97uZJgX8Osk@stanley.mountain>
References: <avV8I97uZJgX8Osk@stanley.mountain>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gb_connection_recv(), the size of the received data is checked
against sizeof(struct gb_operation_msg_hdr) and against the message
size encoded in the header (msg_size), but msg_size itself is never
checked against the header size.

If a peer sends a message whose header claims a size smaller than
the header itself (e.g. header.size == 3), the two existing checks
both pass (size >= sizeof(header) and size >= msg_size), and the
message is dispatched with the undersized msg_size.

In gb_operation_create_incoming(), this leads to an unsigned
integer underflow in:

	request_size = size - sizeof(struct gb_operation_msg_hdr);

The underflowed request_size then wraps back around in
gb_operation_message_alloc():

	message_size = payload_size + sizeof(*header);

causing kzalloc() to allocate a buffer that is too small to hold
the message header.  When the response is later prepared in
gb_operation_response_alloc(), reading
request_header->operation_id reads past the end of the undersized
allocation, triggering a KASAN slab-out-of-bounds report.

Link: https://lore.kernel.org/all/sashiko-outbox-210716@kernel.org/T/
Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
Changes in v3:
- combine the two separate conditions and unify the error message
 as suggested by dan. Thanks!

 drivers/greybus/operation.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd60..74429f3745bb 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -1047,9 +1047,9 @@ void gb_connection_recv(struct gb_connection *connection,
 	/* Use memcpy as data may be unaligned */
 	memcpy(&header, data, sizeof(header));
 	msg_size = le16_to_cpu(header.size);
-	if (size < msg_size) {
+	if (msg_size < sizeof(header) || msg_size > size) {
 		dev_err_ratelimited(dev,
-				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
+				    "%s: invalid message 0x%04x of type 0x%02x received (%zu < %zu)\n",
 				    connection->name,
 				    le16_to_cpu(header.operation_id),
 				    header.type, size, msg_size);
-- 
2.53.0



