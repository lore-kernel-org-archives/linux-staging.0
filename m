Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53E61876
	for <linux-staging@lists.linux.dev>; Sat,  5 Nov 2022 06:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5E8C43144;
	Sat,  5 Nov 2022 06:01:32 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.96)
	(envelope-from <rostedt@goodmis.org>)
	id 1orCFk-007Owt-2q;
	Sat, 05 Nov 2022 02:02:00 -0400
Message-ID: <20221105060200.722822476@goodmis.org>
User-Agent: quilt/0.66
Date: Sat, 05 Nov 2022 02:00:56 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Stephen Boyd <sboyd@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mike Isely <isely@pobox.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Johan Hovold <johan@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Corey Minyard <cminyard@mvista.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v4a 32/38] timers: media: Use timer_shutdown_sync() for on stack timers
References: <20221105060024.598488967@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Before a timer is released, timer_shutdown_sync() must be called.

Link: https://lore.kernel.org/all/20221104054053.431922658@goodmis.org/

Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mike Isely <isely@pobox.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Vladimir Oltean <olteanv@gmail.com>
Cc: Corey Minyard <cminyard@mvista.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index 75c89b07e86a..db000c9145d7 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -3722,7 +3722,7 @@ status);
 	hdw->cmd_debug_state = 5;
 
 	/* Stop timer */
-	del_timer_sync(&timer.timer);
+	timer_shutdown_sync(&timer.timer);
 
 	hdw->cmd_debug_state = 6;
 	status = 0;
-- 
2.35.1
