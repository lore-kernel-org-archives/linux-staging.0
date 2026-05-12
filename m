Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E437206E
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778588825; cv=pass; b=QCr4s8pmaSLT/C9OLmxA9H3ACR+Nik/TgToCMDm6z7nrHjZw8Wu+soKWQuv8za2UTY3hdQyggWatEzQXBtVbZLdy4vgGx84PYf4fxlitxLUPsPBBdRXaTMOVfRaoM4WloH9LccDAREZdNM6jB02AcaDT2iCI2wDJQNABA+aicoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778588825; c=relaxed/simple;
	bh=cXTZ8/fHzWN7MUkMoMam41KcE07031jPMfphtAWHFPk=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=ikJialzijdZ3fW+BOa1nFtZrFTUspI6mzj5QSBV7crIJcnNKFfwP9HYjy7o/k0ixNiZzBMrca9zX555fJ1PPlJthRkc3cLBzFn/NtPRu2PximxMg0dYLNU57hHzwcgsUkdfJUcxeEvgWBj+Eukqx5fCqjVjftlTMeHE9BQAHEEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=MdyTQ6Bn; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="MdyTQ6Bn"
ARC-Seal: i=1; a=rsa-sha256; t=1778588808; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=fWbWvWMQ5gQQLIGkT6om6sb4n2Ebf7dCnXc1pygOnCkDjMYc3eP/ARM6RLu9FFcCBvYMMzWuukFny0Gu7LrTk/cpTH7DseZZh24OJvkbHPzEYBju7APCxLa9IoQ3IKK+5MYN2s2UWR9FMbvPM8UEagsL2nQNfozTNVLqo8CCqc8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1778588808; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=idKpA3QGcwXVL4knfZc5uvUANYZAX8K4vclqwJjlkyo=; 
	b=BUurFe/+eif8ZVWedJ8YwboUuCPc2APyBSrmdGD05e2stm9FW4wwzGlQrf3mjfnBNPs9DfK3J2ccfj/Q6cZOOku5K91SNjWWhLfX3KnZPKTXJyl+E83hZkPVtvZ+FQIq66Y1Az2j8/O1ps7kY9Rd+Ra5cc6kzSVg8H1Z7sWtDPg=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778588808;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=idKpA3QGcwXVL4knfZc5uvUANYZAX8K4vclqwJjlkyo=;
	b=MdyTQ6BncVFzHG8sxkVLn5mVnxBzzz/mD/5oMmYMooGoza6QIpzmA2T9ohioGmgP
	hYUxL3GfCr3jDewtAJzF9SsvTgUuTDZYPq+Pw8mO+cbgVF8XfbwkKyhGrNvixmNDBsg
	7OCtgnhUGoGVerXu/4tShwM5q+arabh7grz3GPPo=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1778588806086936.8678457785732; Tue, 12 May 2026 17:56:46 +0530 (IST)
Received: from  [27.59.63.39] by mail.zoho.in
	with HTTP;Tue, 12 May 2026 17:56:46 +0530 (IST)
Date: Tue, 12 May 2026 17:56:46 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>
Message-ID: <19e1c276bb9.33f3855947400.5648290742103580904@zohomail.in>
Subject: [PATCH v9] staging: rtl8723bs: remove unnecessary braces in
 rtw_mlme.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail


From: Ashwin Gundarapu <linuxuser509@zohomail.in>
Date: Tue, 12 May 2026 17:54:37 +0530
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c

Remove braces around single statement blocks.

Found by checkpatch.pl --strict

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
v9: Removed git header from email body. Fixed all blank line issues.
    Single blank line between statements only.
v8: Fixed double blank lines.
v7: Added version changelog below the --- line.
v6: Fixed indentation and removed trailing whitespace. Rebased against staging-next.
v5: Removed git header from email body. Fixed indentation on the second line of the function call. Added full version history.
v4: Moved changelog below the --- separator. Ran checkpatch.pl.
v3: Fixed double --- line and corrected whitespace formatting.
v2: Resent with corrected whitespace via Thunderbird plain text mode.
v1: Initial patch submission removing unnecessary comparison to true.
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3d88a3a185d5..22776af126ca 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -483,7 +483,6 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			break;
 		}
 
-
 		if (rtw_roam_flags(adapter))
 			/* TODO: don't select network in the same ess as oldest if it's new enough*/
 
-- 
2.43.0

