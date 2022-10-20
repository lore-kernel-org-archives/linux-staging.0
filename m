Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D93F28E2;
	Thu, 20 Oct 2022 07:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666252764; bh=iXEetg5zjspQ6k9kRsMIoOJ7BegCQC+g6tKDG0H1sck=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=HNAWVpWSJeI1BrcmBzAvuB/3a6MtoHHnfpeCtBA1HIK+BDBSBMcX6d7PlAzI/AJFp
	 7M6BNBdyDUC4udkVLwg3bdcG4EpB7i8x8FDa+23y8asBFR9H2q+xlw7AHt6YGK+msy
	 2+s9Zx+j7SYs0TPzD5N1KQZHxg+9ZF33Fr7tLuZ0=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Thu, 20 Oct 2022 09:59:24 +0200 (CEST)
X-EA-Auth: d3ipeoSD/6fFCGgnaNUPPMJ5hMyCQQLEQU/q9o9iC3PQKfFNNLIZZbaH0EaVoXlfOnFIGXW5oxKsa9t3YDOqQZMe1yXtvMGb
Date: Thu, 20 Oct 2022 13:29:20 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumarpraveen@linux.microsoft.com,
	saurabh.truth@gmail.com
Subject: [PATCH v3 09/10] staging: r8188eu: Put '{" on the symbol declaration
 line
Message-ID: <1d99f7351217281946e939644f57fb466ea271ec.1666249716.git.drv@mailo.com>
References: <cover.1666249715.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666249715.git.drv@mailo.com>

Open braces '{" should be placed on the line of symbol declaration as
per the coding-style guidelines. Improves readability and matches with
style used in rest of the code. Issue reported by checkpatch script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v3:
   1. Patch newly added to the patch set.


 drivers/staging/r8188eu/include/rtw_cmd.h | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index d8e6bdb1cf45..aea433e8dcfc 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -445,8 +445,7 @@ struct getrfintfs_parm {
 	u8	rfintfs;
 };

-struct Tx_Beacon_param
-{
+struct Tx_Beacon_param {
 	struct wlan_bssid_ex network;
 };

@@ -682,26 +681,22 @@ struct set_ch_parm {
 };

 /*H2C Handler index: 59 */
-struct SetChannelPlan_param
-{
+struct SetChannelPlan_param {
 	u8 channel_plan;
 };

 /*H2C Handler index: 60 */
-struct LedBlink_param
-{
+struct LedBlink_param {
 	struct LED_871x *pLed;
 };

 /*H2C Handler index: 61 */
-struct SetChannelSwitch_param
-{
+struct SetChannelSwitch_param {
 	u8 new_ch_no;
 };

 /*H2C Handler index: 62 */
-struct TDLSoption_param
-{
+struct TDLSoption_param {
 	u8 addr[ETH_ALEN];
 	u8 option;
 };
@@ -859,8 +854,7 @@ enum rtw_h2c_cmd {
 #define _SetRFReg_CMD_		_Write_RFREG_CMD_

 #ifdef _RTW_CMD_C_
-static struct _cmd_callback	rtw_cmd_callback[] =
-{
+static struct _cmd_callback	rtw_cmd_callback[] = {
 	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
 	{GEN_CMD_CODE(_Write_MACREG), NULL},
 	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
--
2.30.2



