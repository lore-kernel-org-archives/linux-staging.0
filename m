Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66432168
	for <linux-staging@lists.linux.dev>; Fri,  2 Jul 2021 13:04:25 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
	by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <colin.king@canonical.com>)
	id 1lzIq9-0002IF-Df; Fri, 02 Jul 2021 13:04:17 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Colin Ian King <colin.king@canonical.com>
Subject: staging: rtl8712: dead code on flush_signals_thread call in
 r8712_cmd_thread()
Message-ID: <754d23ba-c53f-52e8-9ebd-9f1b2611cc71@canonical.com>
Date: Fri, 2 Jul 2021 14:04:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Static analysis by Coverity has detected a call to
flush_signals_thread() that is never executed.  If it is removed it
won't affect the current behavior, however I'm pretty sure the call was
intentionally placed in the code at the end of a while loop so I believe
there is something a little dubious with the current code.

The analysis by Coverity is as follows:

384                        goto _next;
385                }

Structurally dead code (UNREACHABLE)
unreachable: This code cannot be reached: flush_signals_thread();.

386                flush_signals_thread();
387        }

Any ideas?

Colin
