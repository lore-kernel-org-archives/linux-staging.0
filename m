Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F44A21
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 11:30:17 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B8ArW2S028934;
	Thu, 8 Dec 2022 11:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to :
 subject : message-id : mime-version : content-type; s=pp1;
 bh=KXDlX2V9KxIvwvdtnqYV1mtBeKck+X2u8oot4hHODp8=;
 b=Pv9MYMWF9nhlwfleQaTz2CLqqa/s0hITGN+Vt5qu0lcTM9PDEgKIZyjoJHslAZ+n53TK
 YaPU+3M1EJhseoahEUeBZGtAgMkGdw/ljXBQp65iToGGF2yAN6qmq3CszFOoIN41g1Rx
 2lLICAsaHvyMERcCU/aubkYKkP5hWy6BSGap8qBrRnSdoGOjKa3EjByr75JS3ljslwEs
 ZL+NK6PqBWBu3a9LAJ6B4t9fZDvrTaSRRDseL8FMH8vdLoxMOjIcvYFLeXEqkMlEWrse
 23Yes7sncoQ7wEUM3jbzBwdPe4qcxXjI5RDHY9o9DnGo1TqkyrAkkSELS5PO9q5UNrzm eQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mbejt8syb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Dec 2022 11:30:05 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B895xpI016327;
	Thu, 8 Dec 2022 11:30:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3m9m5y4ahf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Dec 2022 11:30:02 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B8BU0eY18415964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Dec 2022 11:30:00 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2ABB20049;
	Thu,  8 Dec 2022 11:30:00 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D7FC20043;
	Thu,  8 Dec 2022 11:29:58 +0000 (GMT)
Received: from li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com (unknown [9.43.78.178])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  8 Dec 2022 11:29:58 +0000 (GMT)
Date: Thu, 8 Dec 2022 16:59:46 +0530
From: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 RESEND] Staging: greybus: camera: fixed brace coding-style
 and indentation issues
Message-ID: <Y5HKqvmRDvxVaCMN@li-27defe4c-32e1-11b2-a85c-e202e9981075.ibm.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qq20Gxnc-VpMpWyhVg4iyC5b77dWz7QT
X-Proofpoint-ORIG-GUID: qq20Gxnc-VpMpWyhVg4iyC5b77dWz7QT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_06,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212080091

Fixes checkpatch.pl warnings for missing braces in &gcam. Fixes
indentation issues for functions, following the Linux Coding Style.

Signed-off-by: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
---
 drivers/staging/greybus/camera.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index cdbb42cd413b..6516e7efaab9 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
 
 #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
 
-#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
-#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
-#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
+#define gcam_dbg(gcam, format...)	dev_dbg(&(gcam)->bundle->dev, format)
+#define gcam_info(gcam, format...)	dev_info(&(gcam)->bundle->dev, format)
+#define gcam_err(gcam, format...)	dev_err(&(gcam)->bundle->dev, format)
 
 static int gb_camera_operation_sync_flags(struct gb_connection *connection,
 					  int type, unsigned int flags,
@@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
 }
 
 static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp)
+				      struct gb_camera_configure_streams_response *resp)
 {
 	unsigned int max_pkt_size = 0;
 	unsigned int i;
@@ -378,8 +378,8 @@ struct ap_csi_config_request {
 #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
 
 static int gb_camera_setup_data_connection(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
-		struct gb_camera_csi_params *csi_params)
+					   struct gb_camera_configure_streams_response *resp,
+					   struct gb_camera_csi_params *csi_params)
 {
 	struct ap_csi_config_request csi_cfg;
 	struct gb_connection *conn;
@@ -783,8 +783,8 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
 }
 
 static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
-		unsigned int *flags, struct gb_camera_stream *streams,
-		struct gb_camera_csi_params *csi_params)
+					  unsigned int *flags, struct gb_camera_stream *streams,
+					  struct gb_camera_csi_params *csi_params)
 {
 	struct gb_camera *gcam = priv;
 	struct gb_camera_stream_config *gb_streams;
-- 
2.31.1

