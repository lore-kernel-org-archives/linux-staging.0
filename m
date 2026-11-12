Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471757;
	b=1y+XIBK1xmkDY8bEmWYWRB3j351ax26MDktlEyMqCd7DkxCxO3HT+fiS6a7MmMiFW0FU
	 yn1TFabzSCtlFd5+rkPjA0aFxPu2JHPlEtOdlMX1QiXUTTKhD4EI15nPHTR1MLSaMqwwB
	 w/LX64b2DcG3YFgSflaR4F62a52Dk6PiqIl7G/PiqjjKaZ24/4z8zU/IGqDpREHX3IwGD
	 tBJp52QsPqJqRXFHXLUSDbwotO9/UVfKQtylrFgxvbMJQ+p3eyIW07YazV4v5JN393G+Q
	 DvWb5qcICT5a4UQZFEqDEMUiXBJCpnb7qukcNMNYwCYsXgej+GHp1WAiI+k7l1Ra+Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471757;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BDpJwbTGNyEZBddgupUtTkbcG64c1MCzi1j9+WCer18=;
	b=axpId8Y1jL+A9v0XceDi6pg45xFWQGwS7oMUVTkoqCEJbOvCnv7ccNT3XBjslcPXaC00
	 n4a4IM4dmUA59shTsCtD4BOkDz7Bzz2VT+0CXizbO48BEFexk0dPdBnj59hQ7QAOlnIlI
	 n7uZRNMFTBw9wLpUXpWA4DfXYim11GAAsSXKzzRvX9C7iKCN9tSqA+VVAdA18icRMakGj
	 FURwMohX9FKrtKgqmknvquufkqK9ex15dIqbDO4sA6SWQ5PmsTAnW5kW/jjnSP3aKQph3
	 aoP8yf8WnszICFb4JlThpwUYvBfse5aNWHuxFqxDU5y5lu/TNRi1Rt5AbqgYNyy+R0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=JMY58nXi;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BC7606A327
	for <linux-staging@lists.linux.dev>; Thu, 12 Nov 2026 08:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68BC7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=JMY58nXi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=JMY58nXirTmLFo6cDYgwP5FTqY56vSQPrYRHGbZ936HHki5HZygNb/JvGTbs4HmHbwFANl2Me0/F0
	 8TfqMfbiMK/Dma+Yhib2L71+0mfuX0SqFgXLhODoR/TohudZXc3JS62s7V78m/tvuSF444g9Bjkff9
	 tig0kCZ5eWn/e6zw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af57743c3e-bc1d5;
	Thu, 12 Nov 2026 16:22:34 +0800 (CST)
X-RM-TRANSID:2ee16af57743c3e-bc1d5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from utest (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66af57744de0-f911e;
	Thu, 12 Nov 2026 16:22:34 +0800 (CST)
X-RM-TRANSID:2ee66af57744de0-f911e
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] greybus: verify the received message size covers the message header
Date: Thu, 12 Nov 2026 08:22:29 +0000
Message-ID: <20261112082230.33584-1-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6af55517.a0c627da.5d811.0010.GAE@google.com>
References: <6af55517.a0c627da.5d811.0010.GAE@google.com>
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
allocation, triggering a KASAN slab-out-of-bounds report.  When
header.size is zero, kzalloc(0) returns ZERO_SIZE_PTR and the
same read dereferences an invalid address.

Verify msg_size >= sizeof(header) in gb_connection_recv() so that
the "Caller has made sure we at least have a message header"
assumption in gb_operation_create_incoming() actually holds.

Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/greybus/operation.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd60..da53c0e026f0 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -1047,6 +1047,13 @@ void gb_connection_recv(struct gb_connection *connection,
 	/* Use memcpy as data may be unaligned */
 	memcpy(&header, data, sizeof(header));
 	msg_size = le16_to_cpu(header.size);
+	if (msg_size < sizeof(header)) {
+		dev_err_ratelimited(dev,
+				    "%s: invalid message header size (%zu < %zu)\n",
+				    connection->name, msg_size,
+				    sizeof(header));
+		return;
+	}
 	if (size < msg_size) {
 		dev_err_ratelimited(dev,
 				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
-- 
2.53.0



